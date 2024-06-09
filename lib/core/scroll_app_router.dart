import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_app/features/details/presentation/pages/details_page.dart';
import 'package:flutter_scroll_app/features/overview/presentation/pages/overview_page.dart';
import 'package:injectable/injectable.dart';

part 'scroll_app_router.gr.dart';

@injectable
@AutoRouterConfig()
class ScrollAppRouter extends _$ScrollAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OverviewRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: DetailsRoute.page,
          path: '/details/:id',
        ),
      ];
}
