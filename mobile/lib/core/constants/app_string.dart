import 'package:easy_localization/easy_localization.dart';

class AppString {
  AppString._();

  // App
  static const String appName = 'Trello';
  static const String tagline = 'Manage your tasks with ease';

  // Auth
  static String get login => 'login'.tr();
  static String get signUp => 'signUp'.tr();
  static String get email => 'email'.tr();
  static String get password => 'password'.tr();
  static String get name => 'name'.tr();
  static String get logout => 'logout'.tr();

  // Entities
  static String get board => 'board'.tr();
  static String get boards => 'boards'.tr();
  static String get trelloList => 'list'.tr();
  static String get lists => 'lists'.tr();
  static String get card => 'card'.tr();
  static String get cards => 'cards'.tr();

  // Actions
  static String get create => 'create'.tr();
  static String get update => 'update'.tr();
  static String get delete => 'delete'.tr();
  static String get save => 'save'.tr();
  static String get cancel => 'cancel'.tr();
  static String get confirm => 'confirm'.tr();

  // Messages
  static String get loading => 'loading'.tr();
  static String get error => 'error'.tr();
  static String get success => 'success'.tr();
  static String get noData => 'noData'.tr();
  static String get retry => 'retry'.tr();

  // Landing screen
  static String get landingText => 'landingText'.tr();
  static String get termsOfService => 'termsOfService'.tr();
  static String get privacyPolicy => 'privacyPolicy'.tr();
  static String get contactSupport => 'contactSupport'.tr();
  static String get termOfServiceText => 'termOfServiceText'.tr();
}