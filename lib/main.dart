import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/features/landing/screen/landingscreen.dart';
import 'package:whatsapp_clonee/firebase_options.dart';
import 'package:whatsapp_clonee/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (settings) => genereatedRoute(settings),
      home: Landingscreen(),
    );
  }
}
