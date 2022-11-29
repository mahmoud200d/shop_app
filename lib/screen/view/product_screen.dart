import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/compents.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';

import '../../model/home.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if( state is ChangeFavoritesSuccessState){

            if(!state.model.status){
              Fluttertoast.showToast(
                  msg: state.model.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);


            }


          }

        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);

          if (cubit.home != null && cubit.categories != null) {
            return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                              items: cubit.home!.data!.banners
                                  .map((e) => Image(
                                        image: NetworkImage(e.image),
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 20,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                height: 250,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cagegoreies',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 100,
                                  child: ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Image(
                                                image: NetworkImage(cubit
                                                    .categories
                                                    .data!
                                                    .dataModel[index]
                                                    .image),
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    cubit.categories.data!
                                                        .dataModel[index].name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  color: Colors.black
                                                      .withOpacity(0.8))
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 12,
                                        );
                                      },
                                      itemCount: cubit
                                          .categories.data!.dataModel.length),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'New Producte',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: cubit.home!.data!.product.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1,
                                  childAspectRatio: 1 / 1.58,
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                            Image(
                                              image: NetworkImage(cubit.home!
                                                  .data!.product[index].image),
                                              height: 200,
                                              width: double.infinity,
                                            ),
                                          if (cubit.home!.data!.product[index]
                                                  .discount !=
                                              0)
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
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cubit.home!.data!.product[index]
                                                  .name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.3),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${cubit.home! .data!.product[index].price}',
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
                                                if (cubit
                                                        .home!
                                                        .data!
                                                        .product[index]
                                                        .discount !=
                                                    0)
                                                  Text(
                                                    '${cubit.home!.data!.product[index].oldPrice}',
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
                                                      cubit.changeFavorites(cubit.home!.data!.product[index].id, );
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
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ]),
                  ),
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
