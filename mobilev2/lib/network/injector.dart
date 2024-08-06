import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/employees_bloc/employees_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/production_values_bloc/production_values_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/roles_bloc/roles_bloc.dart';

final injector = GetIt.instance;

class Injector {
  Future<void> initializeDependencies() async {
    //Dio client
    injector.registerSingleton<Dio>(Dio());

    //Bloc
    injector.registerFactory<AuthBloc>(() => AuthBloc());
    injector.registerFactory<DivisionsBloc>(() => DivisionsBloc());
    injector.registerFactory<EmployeesBloc>(() => EmployeesBloc());
    injector.registerFactory<RolesBloc>(() => RolesBloc());
    injector
        .registerFactory<ProductionValuesBloc>(() => ProductionValuesBloc());
  }
}
