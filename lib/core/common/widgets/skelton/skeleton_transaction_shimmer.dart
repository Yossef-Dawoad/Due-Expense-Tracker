import 'package:flutter/material.dart';

import 'skelton_container.dart';

class SkeletonTransactionTiles extends StatelessWidget {
  const SkeletonTransactionTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SkeltonContainer(width: 80, height: 80),
                SizedBox(width: 12),
                SkeltonContainer(width: 80)
              ],
            ),
            Column(
              children: [
                SkeltonContainer(width: 80),
                SizedBox(height: 20),
                SkeltonContainer(width: 80),
              ],
            )
          ],
        ),
      ),
    );
  }
}
