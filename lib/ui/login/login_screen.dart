import 'package:bloc_management/bloc/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc; // add loginbloc

  final emailFocusNode = FocusNode();
  final PasswordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log in"),
        ),
        body: BlocProvider(
          create: (_) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("eve.holt@reqres.in"),
                Text("cityslicka"),
                // here we wrap textfoam field with blocbuilder to store emailaddress
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      onChanged: (Value) {
                        context.read<LoginBloc>().add(EmailChanged(
                            eamil:
                                Value)); // here we add event of emailchangesd
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: PasswordFocusNode,
                      decoration: const InputDecoration(
                          hintText: "password", border: OutlineInputBorder()),
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(PasswordChanged(password: value));
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),

                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.error) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text(state.message.toString())));
                    }

                    if (state.loginStatus == LoginStatus.loading) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("SUBMITTING")));
                    }

                    if (state.loginStatus == LoginStatus.success) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("LOGIN Successful")));
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginApi());
                          },
                          child: Text("LOGIN"));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
