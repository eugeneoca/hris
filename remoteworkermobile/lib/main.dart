import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remoteworkermobile/network/injector.dart';
import 'package:remoteworkermobile/src/config/app_routes.dart';
import 'package:remoteworkermobile/src/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Injector().initializeDependencies();
    // await LocalDbInitializr().openIsar();
    runApp(const MainApp());
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => injector()..add(const GetStoredAuthEvent())),
      ],
      child: KeyedSubtree(
        key: key,
        child: MaterialApp(
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 350, name: PHONE),
                const Breakpoint(start: 351, end: 750, name: MOBILE),
                const Breakpoint(start: 751, end: 1920, name: TABLET),
              ],
            );
          },
          title: 'HRIS Remote Worker',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          navigatorKey: MainApp.navigatorKey,
        ),
      ),
    );
  }
}
