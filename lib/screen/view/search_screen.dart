import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  TextEditingController  searchController =TextEditingController();
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit=ShopLoginCubit.get(context);
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body:Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey ,
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (String value) {
                        cubit.searchProduct(value);
                      },
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                          prefix: Icon(Icons.search),),
                    ),
                    SizedBox(height: 10,),

                    if(cubit.state is LoadingSearchState)
                      LinearProgressIndicator(),
                    if(cubit.state is SuccessSearchState)
                    Expanded(
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
                                      image: NetworkImage(cubit.search.data!.data[ index].image),
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
                                        cubit.search.data!.data[ index].name,
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
                                            '${cubit.search.data!.data[ index].price.toString()}',
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
                      }, itemCount: cubit.search.data!.data.length),
                    ),



                  ],
                ),
              ),
            ),
          );
        });
  }
}
