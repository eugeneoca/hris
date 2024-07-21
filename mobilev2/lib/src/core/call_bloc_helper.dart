import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/employees_bloc/employees_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/roles_bloc/roles_bloc.dart';

final authBloc =
    BlocProvider.of<AuthBloc>(MainApp.navigatorKey.currentContext!);
final divisionsBloc =
    BlocProvider.of<DivisionsBloc>(MainApp.navigatorKey.currentContext!);
final employeesBloc =
    BlocProvider.of<EmployeesBloc>(MainApp.navigatorKey.currentContext!);
final rolesBloc =
    BlocProvider.of<RolesBloc>(MainApp.navigatorKey.currentContext!);
