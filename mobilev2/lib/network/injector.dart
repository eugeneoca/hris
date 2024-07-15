import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc.dart';

final injector = GetIt.instance;

class Injector {
  Future<void> initializeDependencies() async {
    //Dio client
    injector.registerSingleton<Dio>(Dio());

    //Bloc
    injector.registerFactory<AuthBloc>(() => AuthBloc());
  }
}
