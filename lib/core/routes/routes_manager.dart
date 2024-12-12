import 'package:flutter/material.dart';
import 'package:gp_nafsi/features/auth/presentation/screens/login/login_screen.dart';
import 'package:gp_nafsi/features/auth/presentation/screens/register/register_screen.dart';

class Routes {
  static const String mainRoute = '/Main';

  ///  Auth Routes
  static const String loginViewRoute = '/LoginView';
  static const String registerViewRoute = '/RegisterView';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginViewRoute:
        return transitionPage(LoginScreen());
      case Routes.registerViewRoute:
        return transitionPage(RegisterScreen());
      default:
        return transitionPage(Container());
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("AppStrings.noRouteFound",
              style: TextStyle(fontSize: 20)),
        ),
        body: const SafeArea(
          child: Center(
            child:
                Text("AppStrings.noRouteFound", style: TextStyle(fontSize: 35)),
          ),
        ),
      ),
    );
  }

  static transitionPage(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
