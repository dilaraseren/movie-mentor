import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mentor/chart/chart_page.dart';
import 'package:movie_mentor/faq/faq_page.dart';
import 'package:movie_mentor/features/movie_flow/genre/genre_screen.dart';
import 'package:movie_mentor/features/movie_flow/movie_flow.dart';
import 'package:movie_mentor/features/movie_flow/profile/login_page.dart';
import 'package:movie_mentor/features/movie_flow/profile/profile_screen.dart';
import 'package:movie_mentor/features/movie_flow/profile/signup.dart';
import 'package:movie_mentor/features/movie_flow/result/result_screen.dart';
import 'package:movie_mentor/features/movie_flow/years_back/years_back_screen.dart';
import 'package:movie_mentor/theme/custom_theme.dart';

import 'firebase_options.dart';
import 'features/movie_flow/landing/landing_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase .initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
  ));
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Recommendation',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/signUp": (context) => SignUp(),
        "/girisYap": (context) => LandingScreen(),
        "/turDevam":(context) => GenreScreen(),
        "/yearsBack":(context) =>YearsBackScreen(),
        "/result":(context) => ResultScreenAnimator(),
        "/profile_page":(context) => ProfilePage(),
         "/faq_page":(context) => FaqPage(),
         "/line_chart":(context) => LineChartPage(),

      },
      home: const MovieFlow(),
    );
  }
}
