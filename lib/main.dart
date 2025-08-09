import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clonee/colors.dart';
import 'package:whatsapp_clonee/common/widgets/loader.dart';
import 'package:whatsapp_clonee/features/auth/controller/authcontroller.dart';
import 'package:whatsapp_clonee/features/auth/screen/user_information_screen.dart';
import 'package:whatsapp_clonee/features/landing/screen/landingscreen.dart';
import 'package:whatsapp_clonee/firebase_options.dart';
import 'package:whatsapp_clonee/router/router.dart';
import 'package:whatsapp_clonee/screens/mobile_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (settings) => genereatedRoute(settings),
      home: ref
          .watch(UserdataAuthProvider)
          .when(
            data: (user) {
              if (user == null) {
                return const Landingscreen();
              } else {
                return const MobileLayoutScreen();
              }
            },
            error: (err, ytace) {
              return ErrorWidget(err.toString());
            },
            loading: ()=>const Loader(),
          ),
    );
  }
}
