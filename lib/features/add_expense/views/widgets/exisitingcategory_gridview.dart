import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExsistingCategoryGridView extends StatefulWidget {
  const ExsistingCategoryGridView({
    super.key,
    required this.onCategorySelected,
  });

  final ValueChanged onCategorySelected;

  @override
  State<ExsistingCategoryGridView> createState() =>
      _ExsistingCategoryGridViewState();
}

class _ExsistingCategoryGridViewState extends State<ExsistingCategoryGridView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onCategorySelected(selectedIndex);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      border: (selectedIndex == index)
                          ? Border.all(width: 4)
                          : null),
                  child: Icon(Icons.fastfood),
                ),
              ),
              Text(
                'food ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
