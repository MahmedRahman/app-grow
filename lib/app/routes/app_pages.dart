import 'package:get/get.dart';

import 'package:grow/app/modules/auth/forget/bindings/auth_forget_binding.dart';
import 'package:grow/app/modules/auth/forget/views/auth_forget_view.dart';
import 'package:grow/app/modules/auth/login/bindings/auth_login_binding.dart';
import 'package:grow/app/modules/auth/login/views/auth_login_view.dart';
import 'package:grow/app/modules/auth/signup/bindings/auth_signup_binding.dart';
import 'package:grow/app/modules/auth/signup/views/auth_signup_view.dart';
import 'package:grow/app/modules/auth/splash/bindings/auth_splash_binding.dart';
import 'package:grow/app/modules/auth/splash/views/auth_splash_view.dart';
import 'package:grow/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:grow/app/modules/checkout/views/checkout_view.dart';
import 'package:grow/app/modules/home/bindings/home_binding.dart';
import 'package:grow/app/modules/home/bindings/home_binding.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/layout/bindings/layout_binding.dart';
import 'package:grow/app/modules/layout/views/layout_view.dart';
import 'package:grow/app/modules/package/bindings/package_binding.dart';
import 'package:grow/app/modules/package/views/package_view.dart';
import 'package:grow/app/modules/payment/bindings/payment_binding.dart';
import 'package:grow/app/modules/payment/views/payment_view.dart';
import 'package:grow/app/modules/profile/bindings/profile_binding.dart';
import 'package:grow/app/modules/profile/views/profile_view.dart';
import 'package:grow/app/modules/settings/bindings/settings_binding.dart';
import 'package:grow/app/modules/settings/views/settings_view.dart';
import 'package:grow/app/modules/youtube/channelVedio/bindings/youtube_channel_vedio_binding.dart';
import 'package:grow/app/modules/youtube/channelVedio/views/youtube_channel_vedio_view.dart';
import 'package:grow/app/modules/youtube/channels/bindings/youtube_channels_binding.dart';
import 'package:grow/app/modules/youtube/channels/views/youtube_channels_view.dart';
import 'package:grow/app/modules/youtube/my_channels/bindings/youtube_my_channels_binding.dart';
import 'package:grow/app/modules/youtube/my_channels/views/youtube_my_channels_view.dart';
import 'package:grow/app/modules/youtubeview/bindings/youtubeview_binding.dart';
import 'package:grow/app/modules/youtubeview/views/youtubeview_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH_SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.AUTH_SPLASH,
      page: () => AuthSplashView(),
      binding: AuthSplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SIGNUP,
      page: () => AuthSignupView(),
      binding: AuthSignupBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGE,
      page: () => PackageView(),
      binding: PackageBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGET,
      page: () => AuthForgetView(),
      binding: AuthForgetBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE_CHANNELS,
      page: () => YoutubeChannelsView(),
      binding: YoutubeChannelsBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE_CHANNEL_VEDIO,
      page: () => YoutubeChannelVedioView(),
      binding: YoutubeChannelVedioBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE_MY_CHANNELS,
      page: () => YoutubeMyChannelsView(),
      binding: YoutubeMyChannelsBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBEVIEW,
      page: () => YoutubeviewView(),
      binding: YoutubeviewBinding(),
    ),
  ];
}
