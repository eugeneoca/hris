import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/pages/dashboard.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/zkteco_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAuthProvider()),
        ChangeNotifierProvider(create: (context) => ZKUserProvider())
      ],
      child: MaterialApp(
        title: 'HRIS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          fontFamily: "Poppins",
          useMaterial3: true,
        ),
        home: const LoginPage(),
        routes: {"/dashboard": (context) => const Dashboard()},
      ),
    );
  }
}
