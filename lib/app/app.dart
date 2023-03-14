import 'package:emerapp/views/ambulance.dart';
import 'package:emerapp/views/map_view.dart';
import 'package:emerapp/views/police_view.dart';
import 'package:emerapp/views/register_view.dart';
import 'package:emerapp/views/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/show_pass.dart';
import '../views/ambulancerequest_view.dart';
import '../views/firebrigade_view.dart';
import '../views/firerequest_view.dart';
import '../views/login_view.dart';
import '../views/policerequest_view.dart';
import '../views/user_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: RegisterView
),  MaterialRoute(
    page: LoginView,
  ),
  MaterialRoute(page: UserView),
  MaterialRoute(
    page: PoliceView,
  ),
  MaterialRoute(
    page: AmbulanceView,
  ),
  MaterialRoute(
    page: FireBrigade,
  ),
  MaterialRoute(
    page: PoliceRequest,
  ),
  MaterialRoute(
    page: AmbulanceRequest,
  ),
  MaterialRoute(
    page: MapView,
  ),
  MaterialRoute(
    page: FireRequest,
  ),
], dependencies: [
  Singleton(
    classType: NavigationService,
  ),
  LazySingleton(
    classType: Spdata,
  ),
])
class app {}
