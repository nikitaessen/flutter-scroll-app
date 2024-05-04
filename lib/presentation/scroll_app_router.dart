import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_app/presentation/widget/details/details_page.dart';
import 'package:flutter_scroll_app/presentation/widget/overview/overview_page.dart';
import 'package:injectable/injectable.dart';

part 'scroll_app_router.gr.dart';

@injectable
@AutoRouterConfig()
class ScrollAppRouter extends _$ScrollAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OverviewRoute.page, initial: true),
        AutoRoute(page: DetailsRoute.page),
      ];
}
