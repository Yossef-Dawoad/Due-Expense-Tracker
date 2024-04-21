import 'dart:math';

import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/custom_textfield.dart';
import 'widgets/colorfull_textfield.dart';
import 'widgets/date_textfield.dart';
import 'widgets/exisitingcategory_gridview.dart';
import 'widgets/gategoryicon_gridview.dart';
import 'widgets/myflex_colorpicker.dart';

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
              const ColorfullTextField(),
              const SizedBox(height: 50),
              MyTextField(
                hintText: 'Select Category',
                prefixIcon: Icon(Iconsax.category, size: 28),
                readOnly: true,
                onTap: () => categoryModelSheet(context),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Add Note',
                prefixIcon: Icon(Iconsax.stickynote4, size: 28),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              DateTextField(),
              const SizedBox(height: 40),
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
                    onPressed: () {},
                    child: Text('save', style: f18WhiteBold),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> categoryModelSheet(BuildContext context) {
    bool addNewCategory = false;
    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Select Category',
                    style: f18BlackBold.copyWith(color: Colors.black54)),
                const SizedBox(height: 20),
                ExsistingCategoryGridView(),
                const SizedBox(height: 20),
                Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Or You Add New Category',
                        style: f18BlackBold.copyWith(color: Colors.black54)),
                    IconButton(
                      icon: Icon(
                        addNewCategory
                            ? Iconsax.minus_square
                            : Iconsax.add_square,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() => addNewCategory = !addNewCategory);
                        print(addNewCategory);
                      },
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (addNewCategory)
                  Column(
                    children: [
                      MyTextField(
                        hintText: 'Category Name',
                        contentPadding: 12,
                        hintTextStyle: f14greyRegularText,
                        showBorder: true,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Category Icon',
                        style: f14greyRegularText,
                      ),
                      CategoryIconGridView(),
                      const SizedBox(height: 20),
                      Text(
                        'Category Color',
                        style: f14greyRegularText,
                      ),
                      MyFlexColorPicker(),
                    ],
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                        )),
                    onPressed: () {},
                    child: Text(
                      'Add Category',
                      style: f18BlackBold.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
