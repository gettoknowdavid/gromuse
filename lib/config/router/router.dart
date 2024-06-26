import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/widgets/loading_indicator.dart';
import '../../features/auth/auth.dart';
import '../../features/delivery/delivery.dart';
import '../../features/favorite/favorite.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/product/product.dart';
import '../../layout/layout.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(dependencies: [AuthNotifier])
GoRouter router(RouterRef ref) {
  final status = ref.watch(authNotifierProvider);
  final isOnboarded = ref.read(isOnboardedProvider);

  final GoRouter router = GoRouter(
    initialLocation: OnboardingRoute.path,
    navigatorKey: _rootNavigatorKey,
    routes: $appRoutes,
    refreshListenable: status,
    redirect: (context, state) {
      final isAllowedPath = status.value.allowedPaths.contains(state.fullPath);

      if (!isOnboarded && !isAllowedPath) return OnboardingRoute.path;

      if (!isAllowedPath) return status.value.redirectPath;

      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}

@TypedGoRoute<OnboardingRoute>(path: '/', name: 'OnboardingPage')
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  static const String path = '/';

  @override
  Widget build(context, state) => const OnboardingPage();
}

@TypedStatefulShellRoute<LayoutRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeStatefulRoute>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: '/home'),
      ],
    ),
    TypedStatefulShellBranch<CategoryStatefulRoute>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CategoryRoute>(path: '/category'),
      ],
    ),
    TypedStatefulShellBranch<FavoriteStatefulRoute>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<FavoriteRoute>(path: '/favorite'),
      ],
    ),
    TypedStatefulShellBranch<DeliveryStatefulRoute>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DeliveryRoute>(path: '/delivery'),
      ],
    ),
  ],
)
class LayoutRoute extends StatefulShellRouteData {
  const LayoutRoute();

  @override
  Widget builder(context, state, navigationShell) => navigationShell;

  static const String $restorationScopeId = '_gromuse_restorationScopeId';

  static Widget $navigatorContainerBuilder(context, navigationShell, children) {
    return LayoutPage(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

class HomeStatefulRoute extends StatefulShellBranchData {
  const HomeStatefulRoute();
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const String path = '/home';

  @override
  Widget build(context, state) => const HomePage();
}

class CategoryStatefulRoute extends StatefulShellBranchData {
  const CategoryStatefulRoute();
}

class CategoryRoute extends GoRouteData {
  const CategoryRoute();

  static const String path = '/category';

  @override
  Widget build(context, state) => const CategoryPage();
}

class FavoriteStatefulRoute extends StatefulShellBranchData {
  const FavoriteStatefulRoute();
}

class FavoriteRoute extends GoRouteData {
  const FavoriteRoute();

  static const String path = '/favorite';

  @override
  Widget build(context, state) => const FavoritePage();
}

class DeliveryStatefulRoute extends StatefulShellBranchData {
  const DeliveryStatefulRoute();
}

class DeliveryRoute extends GoRouteData {
  const DeliveryRoute();

  static const String path = '/delivery';

  @override
  Widget build(context, state) => const DeliveryPage();
}

/// Registration Page
@TypedGoRoute<RegisterRoute>(path: '/register', name: 'RegisterPage')
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  static const String path = '/register';

  @override
  Widget build(context, state) => const RegisterPage();
}

/// Login Page
@TypedGoRoute<LoginRoute>(path: '/login', name: 'LoginPage')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const String path = '/login';

  @override
  Widget build(context, state) => const LoginPage();
}

/// Loading Page
@TypedGoRoute<LoadingRoute>(path: '/loading', name: 'LoadingPage')
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  static const String path = '/loading';

  @override
  Widget build(context, state) => const LoadingPage();
}
