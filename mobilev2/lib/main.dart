import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilev2/network/injector.dart';
import 'package:mobilev2/src/config/app_routes.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/employees_bloc/employees_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/production_values_bloc/production_values_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/roles_bloc/roles_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    await Injector().initializeDependencies();
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
        BlocProvider<DivisionsBloc>(
            create: (_) => injector()..add(const GetDivisionsEvent())),
        BlocProvider<EmployeesBloc>(
            create: (_) => injector()..add(const GetEmployeesEvent())),
        BlocProvider<RolesBloc>(
            create: (_) => injector()..add(const GetRolesEvent())),
        BlocProvider<ProductionValuesBloc>(
            create: (_) => injector()..add(const InitializeProductionValues())),
      ],
      child: KeyedSubtree(
        key: key,
        child: MaterialApp(
          title: 'HRIS',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          navigatorKey: MainApp.navigatorKey,
        ),
      ),
    );
  }
}
