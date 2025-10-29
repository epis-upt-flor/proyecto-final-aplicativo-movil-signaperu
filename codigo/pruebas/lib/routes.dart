import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/translation/sign_to_text_screen.dart';
import 'screens/translation/text_to_sign_screen.dart';
import 'screens/education/levels_screen.dart';
import 'screens/education/lesson_screen.dart';
import 'screens/education/practice_screen.dart';
import 'screens/education/stats_screen.dart';
import 'screens/profile/profile_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const signToText = '/sign-to-text';
  static const textToSign = '/text-to-sign';
  static const levels = '/levels';
  static const lesson = '/lesson';
  static const practice = '/practice';
  static const stats = '/stats';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    home: (_) => const HomeScreen(),
    signToText: (_) => const SignToTextScreen(),
    textToSign: (_) => const TextToSignScreen(),
    levels: (_) => const LevelsScreen(),
    lesson: (_) => const LessonScreen(),
    practice: (_) => const PracticeScreen(),
    stats: (_) => const StatsScreen(),
    profile: (_) => const ProfileScreen(),
  };
  
}
