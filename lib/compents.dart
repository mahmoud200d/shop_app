

import 'package:flutter/material.dart';
import 'package:shop_app/network/dio_helper.dart';

import 'network/shard_pref.dart';

String ?token=  SharedPref.getDate(key: 'token');


void singOut(context){

 SharedPref.removeData(key: 'token').then((value){
   if(value){
       Navigator.pushNamed(context, '/login_screen');
   }
 });

}

