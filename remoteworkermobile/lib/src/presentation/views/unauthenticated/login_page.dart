import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remoteworkermobile/src/core/call_bloc_helper.dart';
import 'package:remoteworkermobile/src/core/constants.dart';
import 'package:remoteworkermobile/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_button.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_text.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_text_field.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTitle(),
                    buildTextFields(),
                    buildButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildButton() {
    return Column(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoadingAuthState) {
              return const CircularProgressIndicator(
                color: Colors.red,
              );
            }
            return Container(
              padding: ResponsiveBreakpoints.of(context).isTablet &&
                      (!Platform.isIOS) &&
                      (!Platform.isIOS)
                  ? const EdgeInsets.symmetric(horizontal: 90.0)
                  : const EdgeInsets.symmetric(horizontal: 30.0),
              child: CustomButton(
                onTap: () => authBloc.add(
                    LoginEvent(emailController.text, passwordController.text)),
                color: ThemeColor.mainColor,
                borderRadius: BorderRadius.circular(20),
                text: "Sign In",
                fontSize: 17,
              ),
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const CustomText(
        //       text: "Don't have an account yet? ",
        //       fontSize: 15,
        //       color: Colors.black,
        //     ),
        //     Material(
        //       type: MaterialType.transparency,
        //       child: InkWell(
        //         onTap: () async {},
        //         child: const CustomText(
        //           text: "Sign Up here",
        //           color: ThemeColor.mainColor,
        //           fontSize: 15,
        //           fontWeight: FontWeight.w600,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Container buildTextFields() {
    return Container(
      margin: ResponsiveBreakpoints.of(context).isTablet && (!Platform.isIOS)
          ? const EdgeInsets.symmetric(horizontal: 90, vertical: 40)
          : const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            label: "Email",
            textColor: Colors.black,
            fontSize:
                ResponsiveBreakpoints.of(context).isTablet && (!Platform.isIOS)
                    ? 17
                    : null,
            height:
                ResponsiveBreakpoints.of(context).isTablet && (!Platform.isIOS)
                    ? 0.1
                    : null,
            prefix: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.email,
                color: Colors.grey,
              ),
            ),
            borderSide:
                const BorderSide(color: ThemeColor.darkGrey, width: 1.2),
          ),
          const SizedBox(height: 17),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setStatePassword) {
            return CustomTextField(
              controller: passwordController,
              label: "Password",
              textColor: Colors.black,
              fontSize: ResponsiveBreakpoints.of(context).isTablet &&
                      (!Platform.isIOS)
                  ? 17
                  : null,
              height: ResponsiveBreakpoints.of(context).isTablet &&
                      (!Platform.isIOS)
                  ? 1.8
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              borderSide:
                  const BorderSide(color: ThemeColor.darkGrey, width: 1.2),
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () => setStatePassword(() {
                  isHidden = !isHidden;
                }),
                icon: isHidden
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
              ),
              obscureText: isHidden,
              validator: (value) {
                if (passwordController.text.isEmpty) {
                  return 'Password is required';
                }

                return null;
              },
            );
          }),
          // const SizedBox(height: 10),
          // InkWell(
          //   onTap: () {},
          //   child: const Align(
          //     alignment: Alignment.centerRight,
          //     child: CustomText(
          //       text: "Forgot Password?",
          //       color: ThemeColor.mainColor,
          //       fontSize: 17,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Column buildTitle() {
    return const Column(
      children: [
        Center(
            child: CustomText(
          text: "HRIS\nRemote Worker",
          fontWeight: FontWeight.w800,
          color: Colors.red,
          textAlign: TextAlign.center,
          fontSize: 30,
        )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
