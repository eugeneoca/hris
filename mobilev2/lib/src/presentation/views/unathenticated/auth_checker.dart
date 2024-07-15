import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/views/authenticated/wrapper.dart';
import 'package:mobilev2/src/presentation/views/unathenticated/login_page.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (context, state) {
          if (state is LoadingAuthState) {
            return false;
          }

          return true;
        },
        builder: (context, state) {
          if (state is UnauthenticatedState) {
            return const LoginPage();
          }
          return const WrapperPage();
        },
      ),
    );
  }
}
