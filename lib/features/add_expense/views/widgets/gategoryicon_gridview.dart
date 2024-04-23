import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CategoryIconGridView extends StatefulWidget {
  const CategoryIconGridView({super.key, required this.onCategoryIconTap});
  final ValueChanged<IconData> onCategoryIconTap;

  @override
  State<CategoryIconGridView> createState() => _CategoryIconGridViewState();
}

class _CategoryIconGridViewState extends State<CategoryIconGridView> {
  final List<IconData> icons = [
    Iconsax.health,
    Icons.fitness_center,
    Icons.fastfood,
    Icons.home,
    Icons.local_dining,
    Icons.local_hospital,
    Icons.local_laundry_service,
    Icons.local_library,
    Icons.local_mall,
    Icons.local_pizza,
    Icons.local_pharmacy,
    Icons.local_shipping,
    Icons.local_taxi,
    Icons.monetization_on,
    Icons.money,
    Icons.movie_filter,
    Icons.restaurant,
    Icons.sports_esports,
    Icons.store,
    Icons.store_mall_directory,
    Icons.theaters,
    Icons.travel_explore,
    Icons.watch_later,
    Icons.work,
    Icons.youtube_searched_for,
    Icons.zoom_in,
    Icons.zoom_out,
    Icons.add_shopping_cart,
    Icons.add_to_home_screen,
    Icons.add_to_photos,
    Icons.add_to_queue,
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.blue),
      ),
      height: 225,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategoryIconTap(icons[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black54,
                border: (selectedIndex == index) ? Border.all(width: 4) : null,
              ),
              child: Icon(
                icons[index],
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
