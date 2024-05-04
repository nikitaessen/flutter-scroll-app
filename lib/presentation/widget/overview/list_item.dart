import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/presentation/app_constants.dart';
import 'package:flutter_scroll_app/shared/scroll_app_router.dart';
import 'package:transparent_image/transparent_image.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.objectNumber,
    required this.title,
    required this.imageUrl,
    required this.headerImageUrl,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderRadius = 16,
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
    final ValueNotifier<double> shadowRadiusNotifier = ValueNotifier<double>(1);

    return ValueListenableBuilder(
        valueListenable: shadowRadiusNotifier,
        builder: (context, spreadRadius, child) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade400,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.shade800,
                  spreadRadius: spreadRadius,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            constraints: const BoxConstraints(
              maxWidth: AppConstants.webContentMaxWidth,
              maxHeight: AppConstants.webContentMaxHeight,
            ),
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: InkWell(
              onHover: (value) {
                if (value) {
                  shadowRadiusNotifier.value = 5;
                } else {
                  shadowRadiusNotifier.value = 1;
                }
              },
              onTap: () => context.router
                  .navigate(DetailsRoute(objectNumber: objectNumber)),
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Stack(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(borderRadius)),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: headerImageUrl,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
