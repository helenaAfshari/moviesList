import 'package:flutter/material.dart';
import 'package:get_list/features/movies_list/pressentation/pages/getmovieslistscreen/get_movies_list_screen.dart';
import 'package:get_list/service_locator.dart';


void main()async {
     WidgetsFlutterBinding.ensureInitialized();
    injector();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
 }

