import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:CycleX/themeprovider/themeprovider.dart';
import 'package:CycleX/Config/AllTitles.dart';
import 'package:CycleX/Config/routes/OneGenerateRoute.dart';
import 'package:CycleX/view/SplashScreen.dart';
import 'package:CycleX/view/HomeScreen.dart';
import 'package:CycleX/view/RoleSelectionScreen.dart';
import 'package:CycleX/view/OwnerDashboard.dart';
import 'package:CycleX/view/RenterDashboard.dart';
import 'package:CycleX/view/MapView.dart';
import 'package:CycleX/view/ProfileScreen.dart';
import 'package:CycleX/view/EditProfileScreen.dart';
import 'package:CycleX/view/PaymentMethodsScreen.dart';
import 'package:CycleX/view/NotificationsScreen.dart';
import 'package:CycleX/view/SecurityScreen.dart';
import 'package:CycleX/view/HelpSupportScreen.dart';
import 'package:CycleX/view/history_screen.dart';
import 'package:CycleX/authentication/login_screen.dart';
import 'package:CycleX/authentication/register_screen.dart';
import 'package:CycleX/authentication/user_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:CycleX/Config/routes/PageConstants.dart';
import 'package:CycleX/services/api_service.dart';
import 'services/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Initialize ApiService
  ApiService.initialize('http://192.169.0.117:5000/api');
  
  // Create userService instance
  final userService = UserService(ApiService.instance);
  
  runApp(MyApp(userService: userService));
}

class MyApp extends StatelessWidget {
  final UserService userService;
  
  const MyApp({super.key, required this.userService});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AllTitles.appTitle,
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      initialRoute: PageConstants.splashScreen,
      onGenerateRoute: OneGeneralRoute.routes,
    );
  }
}
