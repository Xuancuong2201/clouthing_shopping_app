import 'package:ex/screens/forgot_password.dart';
import 'package:ex/screens/login/login.dart';
import 'package:ex/screens/on_boarding.dart';
import 'package:go_router/go_router.dart';
import 'config/route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/'
      ,routes: [
    GoRoute(
        name: RouteConstants.onBoarding,
        path: '/',
        builder: (context, state) {
          return const OnBoardingPage();
        }),
    GoRoute(
        name: RouteConstants.login,
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        }),
    GoRoute(
        name: RouteConstants.forgotPassword,
        path: '/forgotpassword',
        builder: (context, state) {
          return const ForgotPassword();
        })
  ]);
}
