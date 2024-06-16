import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

import 'package:expancetracker/core/common/widgets/custom_textfield.dart';
import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/categories/views/category_selector_widget.dart';
import '../data/models/user_transaction.dart';
import '../logic/transactions_bloc/transactions_bloc.dart';

import 'widgets/colorfull_textfield.dart';
import 'widgets/date_textfield.dart';

// TODO HANDLE INTERNET CONNECTION
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
    _selectedDateNotifier = ValueNotifier(DateTime.now());
  }

  late TextEditingController _amountController;
  late TextEditingController _descriptionController;
  late ValueNotifier<DateTime> _selectedDateNotifier;
  TransactionCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context), icon: const Icon(Iconsax.close_circle))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Add Expense',
                style: f24BlackBold.copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(height: 30),
              ColorfullTextField(controller: _amountController),
              const SizedBox(height: 50),

              BlocBuilder<CategoriesBloc, CategoriesState>(
                buildWhen: (prev, curr) =>
                    curr is CategoryLoading ||
                    curr is CategoryAddSuccess ||
                    curr is CategoryFailure,
                builder: (context, state) => state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  addedsuccess: (category) => MyTextField(
                    hintText: category.title,
                    prefixIcon: Icon(category.icon, size: 28),
                    readOnly: true,
                    fillColor: Colors.green.shade100,
                    onTap: () => categoryModelSheet(context),
                  ),
                  orElse: () => MyTextField(
                    hintText: 'Select Category',
                    prefixIcon: const Icon(Iconsax.category, size: 28),
                    readOnly: true,
                    onTap: () => categoryModelSheet(context),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Write Some Notes...',
                controller: _descriptionController,
                prefixIcon: const Icon(Iconsax.stickynote4, size: 28),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              DateTextField(
                // onDateSelected: (val) => selectedDate = val,
                dateNotifier: _selectedDateNotifier,
              ),
              const SizedBox(height: 40),
              // Save Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => _submitNewExpense(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text('save', style: f18WhiteBold),
                ),
              ),
              BlocListener<TransactionsBloc, TransactionState>(
                listenWhen: (prev, curr) => curr is TransactionAddSuccess,
                listener: (context, state) => state.maybeWhen(
                  addSuccess: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Expense Added Successfully')),
                    );
                    return;
                  },
                  orElse: () => const CircularProgressIndicator(),
                ),
                child: const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> categoryModelSheet(BuildContext context) async {
    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<CategoriesBloc>(),
        child: CategorySelectorWidget(onChanged: (value) => selectedCategory = value),
      ),
    );
  }

  void _submitNewExpense(BuildContext context) {
    context.read<TransactionsBloc>()
      ..add(
        TransactionEvent.addedNewExpense(
          UserTransaction(
            id: const Uuid().v4(),
            amount: double.parse(_amountController.text.trim()),
            datetime: _selectedDateNotifier.value,
            note: _descriptionController.text.trim(),
            category: selectedCategory!,
          ),
        ),
      )
      ..add(const FetchedAllTransactions());
  }
}
