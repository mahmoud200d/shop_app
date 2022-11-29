import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/compents.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/model/login_model.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit=ShopLoginCubit.get(context);
    return BlocConsumer<ShopLoginCubit,ShopLoginState>(
        listener: (context, state) {


        },
    builder: (context, state) {
      nameController.text=cubit.user.data!.name;
      emailController.text=cubit.user.data!.email;
      phoneController.text=cubit.user.data!.phone;



      return cubit.user!=null ?  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'name must not be empty';
                }
                return null;
              },
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
            ),
            TextFormField(

              validator: (value) {
                if (value!.isEmpty) {
                  return 'phone must not be empty';
                }
                return null;
              },
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)),
            ),
            SizedBox(height:20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                singOut(context);
                  },

                child: Text('LOGOUT')),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  cubit.updateUserData(email: emailController.text, name: nameController.text, phone: phoneController.text);
                },

                child: Text('UPDATE')),
          ],
        ),
      ):Center(child: CircularProgressIndicator());

    }


    );
  }
}
