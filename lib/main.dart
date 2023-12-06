import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:threads_clone/responsive/mobile_screen_layout.dart';
// import 'package:threads_clone/responsive/responsive_layout_screen.dart';
// import 'package:threads_clone/responsive/web_screen_layout.dart';
import 'package:threads_clone/utils/colors.dart';

import 'screens/authentication/register_screen.dart';
// import 'package:threads_clone/screens/authentication/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //check this is weather web or mobile and add the firebaseinit
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCwyqdXzZZaAz1fGkmotIpWrt1MJcdaFJI",
          authDomain: "threads-clone-62bf4.firebaseapp.com",
          projectId: "threads-clone-62bf4",
          storageBucket: "threads-clone-62bf4.appspot.com",
          messagingSenderId: "1003105083652",
          appId: "1:1003105083652:web:31a1aee9956f7daadcb051"),
    );
  } else {
    await Firebase.initializeApp();
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Threads clone",
      home: RegisterScreen(),
    );
  }
}
