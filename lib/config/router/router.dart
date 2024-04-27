import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/features/auth/auth.dart';
import 'package:injectable/injectable.dart';

import '../../features/delivery/presentation/delivery/delivery.dart';
import '../../features/favorite/presentation/favorite/favorite.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/product/presentation/category/category.dart';
import '../../features/product/presentation/home/home.dart';
import '../../layout/pages/layout_page.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Injectable()
class GromuseRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: $appRoutes,
  );
}

// extension GromuseRouterX on BuildContext {
//   Future<T?> push<T extends Object?>(String location, {Object? extra}) async {
//     return GoRouter.of(this).push<T>(location, extra: extra);
//   }
// }

@TypedGoRoute<OnboardingRoute>(path: '/', name: 'OnboardingPage')
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

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

  @override
  Widget build(context, state) => const HomePage();
}

class CategoryStatefulRoute extends StatefulShellBranchData {
  const CategoryStatefulRoute();
}

class CategoryRoute extends GoRouteData {
  const CategoryRoute();

  @override
  Widget build(context, state) => const CategoryPage();
}

class FavoriteStatefulRoute extends StatefulShellBranchData {
  const FavoriteStatefulRoute();
}

class FavoriteRoute extends GoRouteData {
  const FavoriteRoute();

  @override
  Widget build(context, state) => const FavoritePage();
}

class DeliveryStatefulRoute extends StatefulShellBranchData {
  const DeliveryStatefulRoute();
}

class DeliveryRoute extends GoRouteData {
  const DeliveryRoute();

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
