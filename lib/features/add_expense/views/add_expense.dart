import 'dart:math';

import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/add_expense/blocs/categories/categories_bloc.dart';
import 'package:expancetracker/features/add_expense/blocs/expenses/expenses_bloc.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

import 'widgets/category_selector_widget.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/colorfull_textfield.dart';
import 'widgets/date_textfield.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? selectedDate;
  TransactionCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Iconsax.close_circle))
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
              ColorfullTextField(
                controller: _amountController,
              ),
              const SizedBox(height: 50),
              MyTextField(
                hintText: 'Select Category',
                prefixIcon: const Icon(Iconsax.category, size: 28),
                readOnly: true,
                onTap: () => categoryModelSheet(
                  context,
                  onChanged: (val) => selectedCategory = val,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Add Note',
                controller: _descriptionController,
                prefixIcon: const Icon(Iconsax.stickynote4, size: 28),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              DateTextField(
                onDateSelected: (val) => selectedDate = val,
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
                  onPressed: () {
                    context
                        .read<ExpensesBloc>()
                        .add(ExpensesEvent.addedNewExpense(
                          MoneyTransaction(
                            id: const Uuid().v4(),
                            amount: double.parse(_amountController.text.trim()),
                            datetime: selectedDate!,
                            note: _descriptionController.text.trim(),
                            category: selectedCategory!,
                          ),
                        ));
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> categoryModelSheet(
    BuildContext context, {
    required ValueChanged<TransactionCategory> onChanged,
  }) async {
    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<CategoriesBloc>(),
        child: CategorySelectorWidget(),
      ),
    );
  }
}
