import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/core/shared_preferences.dart';
import 'package:hogozat/ui/login/manager/login_cubit.dart';
import '../../main/page/main.dart';
import '../../register/page/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            login(state);
          },
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'exam@gmail.com',
                            hintStyle: TextStyle(color: Color(0xff9E9E9E8E)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email required";
                            } else if (!value.contains("@") ||
                                !value.contains(".")) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password"),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            print(state);
                            return TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              obscureText: cubit.valuePassword,
                              decoration: InputDecoration(
                                hintText: '********',
                                suffixIcon: IconButton(
                                  onPressed: () => cubit.toggel(),
                                  icon: Icon(
                                    cubit.valuePassword
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Color(0xff9E9E9E8E)),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password required";
                                }
                                if (value.length < 8) {
                                  return "Invalid Password";
                                }
                                return null;
                              },
                            );
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Forget your password ?'),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.blue),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                        ),
                        onPressed: () =>
                            cubit.login(
                                email: emailController.text,
                                password: passwordController.text),
                        child: Text('Login', style: TextStyle(color: Colors
                            .white)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account? '),
                        InkWell(
                          onTap: () => navToRegisterScreen(),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  navToRegisterScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
  }

  void login(LoginState state) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (state is LoginSuccessState) {
      Fluttertoast.showToast(msg: state.massage);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen()));
    } else if (state is LoginFailureState) {
      Fluttertoast.showToast(msg: state.errorMassage);
    }
  }


}
