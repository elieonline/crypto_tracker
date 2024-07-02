// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:crypto_tracker/features/auth/pages/splash.dart' as _i4;
import 'package:crypto_tracker/features/dashboard/pages/add_asset.dart' as _i1;
import 'package:crypto_tracker/features/dashboard/pages/compare_assets.dart'
    as _i2;
import 'package:crypto_tracker/features/dashboard/pages/dashboard.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddAssetRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddAssetPage(),
      );
    },
    CompareAssetRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CompareAssetPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAssetPage]
class AddAssetRoute extends _i5.PageRouteInfo<void> {
  const AddAssetRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddAssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAssetRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CompareAssetPage]
class CompareAssetRoute extends _i5.PageRouteInfo<void> {
  const CompareAssetRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CompareAssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompareAssetRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
