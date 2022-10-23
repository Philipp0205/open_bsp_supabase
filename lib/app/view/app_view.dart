import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:very_good_supabase/auth_states_supabase/auth.dart';
import 'package:very_good_supabase/categories/view/category_page.dart';
import 'package:very_good_supabase/l10n/l10n.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends AuthStateSupabase<AppView> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Good Supabase',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xff44475a)),
        scaffoldBackgroundColor: const Color(0xff2e3440),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.teal,
          background: Colors.red,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff88c0d0),
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xfff8f8f2),
          ),
          headline3: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xfff8f8f2),
          ),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CategoryPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const CategoryView(),
      //   // '/quiz': (context) => const QuizHomePage(),
      // },
      // home: FlowBuilder<AppStatus>(
      //   state: context.select((AppBloc bloc) => bloc.state.status),
      //   onGeneratePages: onGenerateAppViewPages,
      // ),
    );
  }
}
