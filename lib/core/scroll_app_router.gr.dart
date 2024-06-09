// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'scroll_app_router.dart';

abstract class _$ScrollAppRouter extends RootStackRouter {
  // ignore: unused_element
  _$ScrollAppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () =>
              DetailsRouteArgs(objectNumber: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          objectNumber: args.objectNumber,
          key: args.key,
        ),
      );
    },
    OverviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OverviewPage(),
      );
    },
  };
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required String objectNumber,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            objectNumber: objectNumber,
            key: key,
          ),
          rawPathParams: {'id': objectNumber},
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.objectNumber,
    this.key,
  });

  final String objectNumber;

  final Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{objectNumber: $objectNumber, key: $key}';
  }
}

/// generated route for
/// [OverviewPage]
class OverviewRoute extends PageRouteInfo<void> {
  const OverviewRoute({List<PageRouteInfo>? children})
      : super(
          OverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OverviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
