import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/pages/splash_screen/splach_screen_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  await Hive.openBox('DadosCadastraisModel');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MainPage(),
      home: SplashScreenPage(),
    );
  }
}
