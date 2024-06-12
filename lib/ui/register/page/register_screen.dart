import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/ui/register/manager/register_cubit.dart';
import '../../login/page/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(title: Text('Register'), centerTitle: true),
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            register(state);
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'exam',
                            hintStyle: TextStyle(color: Color(0xff9E9E9E8E)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name required";
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
                        Text("Phone Number"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '01234567890',
                            hintStyle: TextStyle(color: Color(0xff9E9E9E8E)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone required";
                            } else if (value.length != 11) {
                              return "Invalid phone number";
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
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: cubit.valuePassword,
                              decoration: InputDecoration(
                                hintText: '********',
                                suffixIcon: IconButton(
                                  onPressed: () => cubit.toggal(),
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
                            cubit.createAccount(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text),
                        child:
                        Text('Register', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                        InkWell(
                          onTap: () => navToLoginScreen(),
                          child: Text(
                            'Login',
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


  navToLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void register(RegisterState state) {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      if (state is RegisterSuccessState) {
        Fluttertoast.showToast(msg: state.massage);
        Navigator.pop(context);
      } else if (state is RegisterFailureState) {
        Fluttertoast.showToast(msg: state.errorMassage);
      }
    }
  }
}
