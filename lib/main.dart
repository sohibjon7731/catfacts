import 'dart:io';

import 'package:catfacts/features/presentation/bloc/cat_bloc.dart';
import 'package:catfacts/features/presentation/cat_facts_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox("text");
  
  await Hive.openBox("data");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CatFactsScreen(),
      ),
    );
  }
}
