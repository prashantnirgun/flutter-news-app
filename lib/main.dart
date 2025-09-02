import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/blocs/breaking_news/breaking_news_bloc.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_bloc.dart';
import 'package:news_app/presentation/screens/splash_page.dart';
import 'package:news_app/services/api/api_helper.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BreakingNewsBloc(apiHelper: ApiHelper()),
        ),
        BlocProvider(
          create: (context) => TrendingNewsBloc(apiHelper: ApiHelper()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashPage(),
    );
  }
}
