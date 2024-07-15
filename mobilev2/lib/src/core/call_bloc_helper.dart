import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc.dart';

final authBloc =
    BlocProvider.of<AuthBloc>(MainApp.navigatorKey.currentContext!);
