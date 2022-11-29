import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/compents.dart';
import 'package:shop_app/screen/auth/register_screen.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../network/shard_pref.dart';
import '../view/home_layout_screen.dart';

enum ToastState { success, error, waring }

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {

    }, builder: (context, state) {
      var cubit = ShopLoginCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  'Login now to browse hot our offers',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email must not be empty';
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: isPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email must not be empty';
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: 'password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: isPassword
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ShopLoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text);

                        Navigator.pushNamed(context, '/home_layout_screen');

                      }
                      if (cubit.login.status) {
                        SharedPref.savaData(key: 'token', value: cubit.login.data!.token)
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: cubit.login.message,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushNamed(context, '/home_layout_screen');

                        });
                      }else{

                        Fluttertoast.showToast(
                            msg: cubit.login.message,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);


                      }




                    },
                    child: Text('LOGIN')),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text('REGISTER ')),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
