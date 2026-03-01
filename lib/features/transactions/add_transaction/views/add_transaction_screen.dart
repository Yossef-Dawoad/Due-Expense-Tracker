import 'package:flutter/widget_previews.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/features/transactions/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/models/transaction.dart';
import '../viewmodels/add_transaction_viewmodel.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late final AddTransactionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AddTransactionViewModel(
      walletService: locator<WalletService>(),
      transactionService: locator<TransactionService>(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors from design
    const primaryColor = Color(0xFF39E079);
    const backgroundColor = Color(0xFFF6F8F7);
    const darkBackgroundColor = Color(0xFF122017);
    const textColor = Color(0xFF0E1A13);
    const secondaryTextColor = Color(0xFF51946B);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bg = isDarkMode ? darkBackgroundColor : backgroundColor;
    final text = isDarkMode ? Colors.white : textColor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  // Top App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, color: text, size: 28),
                        ),
                        Text(
                          'Add New Transaction',
                          style: GoogleFonts.manrope(
                            color: text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: _viewModel.reset,
                          child: Text(
                            'Reset',
                            style: GoogleFonts.manrope(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Transaction Type Switch
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(
                          alpha: isDarkMode ? 0.05 : 0.1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ValueListenableBuilder<TransactionType>(
                        valueListenable: _viewModel.transactionType,
                        builder: (context, type, _) {
                          return Row(
                            children: [
                              _buildTypeSegment(
                                'Expense',
                                TransactionType.expense,
                                type,
                                text,
                                secondaryTextColor,
                              ),
                              _buildTypeSegment(
                                'Income',
                                TransactionType.income,
                                type,
                                text,
                                secondaryTextColor,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Amount
                  Column(
                    children: [
                      Text(
                        'AMOUNT',
                        style: GoogleFonts.manrope(
                          color: secondaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ValueListenableBuilder<String>(
                        valueListenable: _viewModel.amountString,
                        builder: (context, amountStr, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '\$',
                                style: GoogleFonts.manrope(
                                  color: primaryColor.withValues(alpha: 0.6),
                                  fontSize: 56,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              IntrinsicWidth(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  style: GoogleFonts.manrope(
                                    color: text,
                                    fontSize: 56,
                                    fontWeight: FontWeight.w800,
                                    height: 1.1,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: '0',
                                  ),
                                  onChanged: _viewModel.setAmount,
                                  controller:
                                      TextEditingController(
                                          text: amountStr == '0'
                                              ? ''
                                              : amountStr,
                                        )
                                        ..selection =
                                            TextSelection.fromPosition(
                                              TextPosition(
                                                offset: amountStr == '0'
                                                    ? 0
                                                    : amountStr.length,
                                              ),
                                            ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category',
                          style: GoogleFonts.manrope(
                            color: text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildCategoryGrid(primaryColor, text, isDarkMode),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details',
                          style: GoogleFonts.manrope(
                            color: text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Date Picker
                        Text(
                          'Date',
                          style: GoogleFonts.manrope(
                            color: secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _viewModel.date.value,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              _viewModel.setDate(picked);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xFF1A2E22)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDarkMode
                                    ? const Color(0xFF2A4535)
                                    : const Color(0xFFD1E6D9),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: secondaryTextColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                ValueListenableBuilder<DateTime>(
                                  valueListenable: _viewModel.date,
                                  builder: (context, date, _) {
                                    return Text(
                                      DateFormat('MMM d, yyyy').format(date),
                                      style: GoogleFonts.manrope(
                                        color: text,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Notes
                        Text(
                          'Notes',
                          style: GoogleFonts.manrope(
                            color: secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xFF1A2E22)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode
                                  ? const Color(0xFF2A4535)
                                  : const Color(0xFFD1E6D9),
                            ),
                          ),
                          child: TextField(
                            controller: _viewModel.notesController,
                            maxLines: 3,
                            style: GoogleFonts.manrope(
                              color: text,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: 'What was this for?',
                              hintStyle: GoogleFonts.manrope(
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Additional padding for scrolling
                  const SizedBox(height: 100),
                ],
              ),
            ),

            // Bottom Save Button
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      final success = await _viewModel.saveTransaction();
                      if (success && context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: const Color(0xFF0E1A13),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _viewModel.isSaving,
                      builder: (context, isSaving, _) {
                        if (isSaving) {
                          return const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Color(0xFF0E1A13),
                              strokeWidth: 2,
                            ),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Save Transaction',
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.check_circle_outline, size: 24),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSegment(
    String label,
    TransactionType value,
    TransactionType selected,
    Color activeTextColor,
    Color inactiveTextColor,
  ) {
    final isSelected = value == selected;
    return Expanded(
      child: GestureDetector(
        onTap: () => _viewModel.setTransactionType(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1E3225)
                      : Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: GoogleFonts.manrope(
              color: isSelected ? activeTextColor : inactiveTextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(
    Color primaryColor,
    Color textColor,
    bool isDarkMode,
  ) {
    // Mock categories for UI implementation
    final categories = [
      (name: 'Food', icon: Icons.restaurant),
      (name: 'Shopping', icon: Icons.shopping_bag),
      (name: 'Transport', icon: Icons.directions_car),
      (name: 'Health', icon: Icons.monitor_heart),
      (name: 'Rent', icon: Icons.house),
      (name: 'Other', icon: Icons.more_horiz),
    ];

    return ValueListenableBuilder<Category?>(
      valueListenable: _viewModel.selectedCategory,
      builder: (context, selected, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            final isSelected = selected?.name == cat.name;

            return GestureDetector(
              onTap: () {
                _viewModel.setCategory(
                  Category(
                    id: index.toString(),
                    userId: '',
                    name: cat.name,
                    icon: cat.icon.codePoint.toString(),
                    color: Colors.blue.toARGB32().toRadixString(16),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF1A2E22) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? primaryColor
                        : isDarkMode
                        ? const Color(0xFF2A4535)
                        : const Color(0xFFD1E6D9),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      cat.icon,
                      color: isSelected
                          ? primaryColor
                          : (isDarkMode ? Colors.white70 : Colors.black87),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      cat.name,
                      style: GoogleFonts.manrope(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

@Preview()
Widget addTransactionScreenPreview() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: Center(child: AddTransactionScreen())),
  );
}
