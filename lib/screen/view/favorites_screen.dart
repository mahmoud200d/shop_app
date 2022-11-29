import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';

import '../../cubit/states.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopLoginCubit.get(context);
    return BlocConsumer <ShopLoginCubit, ShopLoginState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {

          return cubit.favoritesModel.data!.dataModel.isNotEmpty  ?Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(itemBuilder: (context,index){
              return Container(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: NetworkImage(cubit.favoritesModel.data!.dataModel[ index].product!.image),
                            width: 120,
                            height: 120,

                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Text(
                                'DISCOUNT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                            color: Colors.red,
                          )
                        ],
                        alignment:
                        AlignmentDirectional.bottomStart,
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.favoritesModel.data!.dataModel[ index].product!.name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            Row(

                              children: [
                                Text(
                                  '${cubit.favoritesModel.data!.dataModel[ index].product!.price.toString()}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                    color: Colors.blue,
                                  ),
                                  maxLines: 2,
                                  overflow:
                                  TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                if (
                                cubit.favoritesModel.data!.dataModel[ index].product!
                                    .discount !=
                                    0)
                                  Text(
                                    '${cubit.favoritesModel.data!.dataModel[ index].product!.oldPrice.toString()}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.w600,
                                      height: 1.3,
                                      color:
                                      Colors.grey.shade700,
                                      decoration: TextDecoration
                                          .lineThrough,
                                    ),
                                    maxLines: 2,
                                    overflow:
                                    TextOverflow.ellipsis,
                                  ),
                                Spacer(),

                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      cubit.changeFavorites(cubit.favoritesModel.data!.dataModel[ index].product!.id);
                                    },
                                    icon: Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                  radius: 15,
                                  backgroundColor:(cubit.favorites[cubit.home!.data!.product[index].id])!?Colors.blue:Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],

                  ),
                ),
              );

            }, separatorBuilder: (context,index){
              return Container(height: 1,width: double.infinity,color: Colors.grey,);
            }, itemCount: cubit.favoritesModel.data!.dataModel.length),
          ):CircularProgressIndicator();
        }

    );
  }
}