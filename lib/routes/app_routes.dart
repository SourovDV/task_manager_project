import 'package:get/get.dart';
import 'package:task_manager_project/feature/Bottom_items/binding/item_binding.dart';
import 'package:task_manager_project/feature/Bottom_items/view/item_view.dart';
import 'package:task_manager_project/feature/forgot_password/bindings/forgot_binding.dart';
import 'package:task_manager_project/feature/forgot_password/view/forgot_email_verification.dart';
import 'package:task_manager_project/feature/forgot_password/view/pin_verification.dart';
import 'package:task_manager_project/feature/forgot_password/view/set_password.dart';
import 'package:task_manager_project/feature/sign_in/binding/sign_in_bindings.dart';
import 'package:task_manager_project/feature/sign_in/view/sign_in_view.dart';
import 'package:task_manager_project/feature/sign_up/binding/sign_up_binding.dart';
import 'package:task_manager_project/feature/sign_up/view/sign_up_view.dart';
import 'package:task_manager_project/feature/splash_screen/binding/splash_bindings.dart';
import 'package:task_manager_project/feature/splash_screen/view/splash_view.dart';
import 'package:task_manager_project/routes/app_pages.dart';

class AppRoutes{
  static final String initialRoute = AppPages.splashScreen;

  static final  route =[
    GetPage(name:AppPages.splashScreen, page: ()=>SplashView(),binding: SplashBindings()),
    GetPage(name:AppPages.signIn, page: ()=>SignInView(),binding: SignInBinding()),
    GetPage(name:AppPages.forgotEmailVerification, page: ()=>ForgotEmailVerification(),binding: ForgotBindings()),
    GetPage(name:AppPages.pinVerification, page: ()=>PinVerification(),binding: ForgotBindings()),
    GetPage(name:AppPages.setPassword, page: ()=>SetPassword(),binding: ForgotBindings()),
    GetPage(name:AppPages.signUp, page: ()=>SignUpView(),binding: SignUpBinding()),
    GetPage(name:AppPages.itemNavber, page: ()=>ItemView(),binding: ItemBindings()),
  ];

}