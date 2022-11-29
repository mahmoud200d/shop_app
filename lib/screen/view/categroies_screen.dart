import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';

import '../../cubit/states.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
// return Center(child: Text('Favorites',
//       style: Theme.of(context).textTheme.bodyText1,
//     )
  @override
  Widget build(BuildContext context) {
 var cubit =  ShopLoginCubit.get(context);
  return BlocConsumer<ShopLoginCubit,ShopLoginState>(
     listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
      return ListView.separated(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: NetworkImage(
                  cubit.categories!.data!.dataModel[index].image),
                width: 120,
                height: 120,
                fit: BoxFit.cover,),
              Text(cubit.categories!.data!.dataModel[index].name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        );
      }, separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          width: double.infinity,
          height: 1,
        );
      }, itemCount: cubit.categories!.data!.dataModel.length);

    }
     );
  }
}
