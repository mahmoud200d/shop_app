import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/screen/view/search_screen.dart';

class HomeLayoutScreen extends StatelessWidget {
  HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopLoginCubit cubit = ShopLoginCubit.get(context);
        return BlocConsumer<ShopLoginCubit,ShopLoginState>(
           listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {

    return   Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Salla',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            }, icon: Icon(Icons.search, color: Colors.black,))
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: cubit.screen[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeBottomNavigationBar(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_outlined),
              label: 'Catgories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            )
          ],
        ),
      );
    }
        );
  }
}
