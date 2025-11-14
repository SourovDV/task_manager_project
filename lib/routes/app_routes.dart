import 'package:get/get.dart';
import 'package:task_manager_project/feature/forgot_password/bindings/forgot_binding.dart';
import 'package:task_manager_project/feature/forgot_password/view/forgot_email_verification.dart';
import 'package:task_manager_project/feature/sign_in/binding/sign_in_bindings.dart';
import 'package:task_manager_project/feature/sign_in/view/sign_in_view.dart';
import 'package:task_manager_project/feature/splash_screen/binding/splash_bindings.dart';
import 'package:task_manager_project/feature/splash_screen/view/splash_view.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class AppRoutes{
  static final String initialRoute = AppPages.splashScreen;

  static final  route =[
    GetPage(name:AppPages.splashScreen, page: ()=>SplashView(),binding: SplashBindings()),
    GetPage(name:AppPages.signIn, page: ()=>SignInView(),binding: SignInBinding()),
    GetPage(name:AppPages.forgotEmailVerification, page: ()=>ForgotEmailVerification(),binding: ForgotBindings()),
  ];

}