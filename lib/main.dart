import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_api_app/viewmodel/character_list_viewmodel.dart';
import 'package:rm_api_app/views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CharacterListViewmodel(),
      child: const MainApp(),
    ),
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("RM API APP")),
        body: HomeView(),
      ),
    );
  }
}
