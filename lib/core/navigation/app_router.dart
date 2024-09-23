/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qanony/features/dates/ui/views/my_dates_view.dart';

import '../../features/dates/ui/views/visit_details.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material(); 

  @override
  List<AutoRoute> get routes => [
     AutoRoute(page: MydatesRoute.page, initial: true), // Initial route
     AutoRoute(page: VisitDetailsRoute.page), // Rename to VisitDetailsRoute
  ];
} */