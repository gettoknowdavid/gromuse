import 'package:gromuse/config/config.dart';
import 'package:gromuse/config/router/router.dart';

enum AuthStatus {
  unauthenticated(
    redirectPath: LoginRoute.path,
    allowedPaths: [RegisterRoute.path, LoginRoute.path],
  ),

  authenticated(
    redirectPath: HomeRoute.path,
    allowedPaths: [
      HomeRoute.path,
      CategoryRoute.path,
      FavoriteRoute.path,
      DeliveryRoute.path,
    ],
  ),

  unverified(
    redirectPath: '',
    allowedPaths: [],
  );

  const AuthStatus({
    required this.redirectPath,
    required this.allowedPaths,
  });

  /// The target path to redirect when the current route is not allowed in this
  /// auth state.
  final String redirectPath;

  /// List of paths allowed when the app is in this auth state.
  final List<String> allowedPaths;
}
