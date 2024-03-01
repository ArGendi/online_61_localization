

// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:online_61_localization/cubits/language/language_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text( local.home_screen ),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
            onPressed: (){
              BlocProvider.of<LanguageCubit>(context).changeLanguage("ar");
            }, 
            child: Text("Arabic"),
          ),
          TextButton(
            onPressed: (){
              BlocProvider.of<LanguageCubit>(context).changeLanguage("en");
            }, 
            child: Text("English"),
          ),
          TextButton(
            onPressed: (){
              BlocProvider.of<LanguageCubit>(context).changeLanguage("fr");
            }, 
            child: Text("French"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateTime.now().hour < 17 ? 
                local.good_morning : local.good_evening,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              local.go_next,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.language_outlined),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}