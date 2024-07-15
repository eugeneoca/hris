import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remoteworkermobile/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:remoteworkermobile/src/presentation/views/authenticated/dashboard.dart';
import 'package:remoteworkermobile/src/presentation/views/unauthenticated/login_page.dart';

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
          } else if (state is AuthenticatedState) {
            return const DashboardPage();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
