import 'package:get/get.dart';

import '../modules/email_verification/bindings/email_verification_binding.dart';
import '../modules/email_verification/views/email_verification_view.dart';
import '../modules/find_password/bindings/find_password_binding.dart';
import '../modules/find_password/views/find_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mobile_verification/bindings/mobile_verification_binding.dart';
import '../modules/mobile_verification/views/mobile_verification_view.dart';
import '../modules/on_bording/bindings/on_bording_binding.dart';
import '../modules/on_bording/views/on_bording_view.dart';
import '../modules/pre_work_checklist/bindings/pre_work_checklist_binding.dart';
import '../modules/pre_work_checklist/views/pre_work_checklist_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/recover_account/bindings/recover_account_binding.dart';
import '../modules/recover_account/views/recover_account_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRE_WORK_CHECKLIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ON_BORDING,
      page: () => const OnBordingView(),
      binding: OnBordingBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.RECOVER_ACCOUNT,
      page: () => const RecoverAccountView(),
      binding: RecoverAccountBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => const EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.FIND_PASSWORD,
      page: () => const FindPasswordView(),
      binding: FindPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_VERIFICATION,
      page: () => const MobileVerificationView(),
      binding: MobileVerificationBinding(),
    ),
    GetPage(
      name: _Paths.PRE_WORK_CHECKLIST,
      page: () => PreWorkChecklistView(),
      binding: PreWorkChecklistBinding(),
    ),
  ];
}
