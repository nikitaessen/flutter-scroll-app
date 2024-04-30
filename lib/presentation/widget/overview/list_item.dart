import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/presentation/app_constants.dart';
import 'package:flutter_scroll_app/shared/scroll_app_router.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.objectNumber,
    required this.title,
    required this.imageUrl,
    required this.headerImageUrl,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderRadius = 8,
  });

  final String objectNumber;

  final String title;

  final String imageUrl;

  final String headerImageUrl;

  final Color backgroundColor;

  final Color borderColor;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: AppConstants.webContentMaxWidth,
      ),
      child: InkWell(
        onTap: () => context.router.navigate(DetailsRoute(objectNumber: objectNumber)),
        child: DecoratedBox(
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
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
                child: Image.network(
                  headerImageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
