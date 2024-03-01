// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_61_localization/cubits/language/language_cubit.dart';
import 'package:online_61_localization/local/cache.dart';
import 'package:online_61_localization/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  print("---------- ${Platform.localeName} ------------");
  await Cache.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates ,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale( BlocProvider.of<LanguageCubit>(context).lang ),
        );
      },
    );
  }
}