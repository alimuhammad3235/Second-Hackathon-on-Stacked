import 'package:emerapp/views/register_view.dart';
import 'package:emerapp/views/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/show_pass.dart';
import '../views/login_view.dart';
import '../views/user_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(
    page: RegisterView,
  ),
  MaterialRoute(
    page: LoginView,
  ),
  MaterialRoute(page: UserView)
], dependencies: [
  Singleton(
    classType: NavigationService,
  ),
  // LazySingleton(
  //   classType: AuthService,
  // ),
])
class app {}
