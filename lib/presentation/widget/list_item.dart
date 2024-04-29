import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.imageUrl,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderRadius = 8,
  });

  final String title;

  final String imageUrl;

  final Color backgroundColor;

  final Color borderColor;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     Image.network(
                //       imageUrl,
                //       fit: BoxFit.cover,
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(title),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
