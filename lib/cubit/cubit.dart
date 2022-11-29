import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/compents.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/model/favories.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/screen/view/categroies_screen.dart';
import 'package:shop_app/screen/view/favorites_screen.dart';
import 'package:shop_app/screen/view/product_screen.dart';
import 'package:shop_app/screen/view/settings_screen.dart';

import '../model/categories.dart';
import '../model/home.dart';
import '../model/login_model.dart';
import '../model/search.dart';
import '../network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  ShopLoginModel login=ShopLoginModel();

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      login = ShopLoginModel.fromJson(value.data);

      emit(ShopLoginSuccessState());
    }).catchError((error) {
      emit(ShopLoginErrorState());
    });
  }

  ShopLoginModel register=ShopLoginModel();

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: Register, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    }).then((value) {
      print(value);
      register = ShopLoginModel.fromJson(value.data);

      emit(ShopRegisterSuccessState());
    }).catchError((error) {
      emit(ShopRegisterSuccessErrorState());
    });
  }

  List<Widget> screen = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void changeBottomNavigationBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBarState());
  }

  Map<int, bool> favorites = {};

  Home? home;

  void getData() {
    emit(LoadingHomeDataState());
    print(token);
    DioHelper.getDate(url: HOME, token: 'imlE0DLDaH5E9ThXXQMPBvtCNwq0cbyzIzUUNzdP79lLVXpCVuaYINhAg1F8nWC0Wqbr8L').then((value) {
      print(value.data);
      home = Home.fromJson(value.data);

      home!.data!.product.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });

        print(favorites.toString());
      });

      emit(SuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHomeDataState());
    });
  }

  Categories categories=Categories();

  void getCategories() {
    DioHelper.getDate(url: getGategories).then((value) {
      print(value.data);
      categories = Categories.fromJson(value.data);
      emit(SuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesDataState());
    });
  }

  FavoritesModel favoritesModel=FavoritesModel();

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;

    DioHelper.postData(
            url: Favorites,
            data: {
              'product_id': productId,
            },
            token: token)
        .then((value) {
      print(value.data);

      favoritesModel = FavoritesModel.fromJson(value.data);
      if (!favoritesModel.status) {
        favorites[productId] = !favorites[productId]!;
        emit(ChangeFavoritesSuccessState(favoritesModel));
      } else {
        getFavorites();
      }
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ChangeErrorFavoritesState());
    });
  }

  void getFavorites() {
    emit(LoadingFavoritesState());
    DioHelper.getDate(url: Favorites, token: token).then((value) {
      print(value.data);
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data);
      emit(GetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetFavoritesState());
    });
  }

  ShopLoginModel user=ShopLoginModel();

  void getUserData() {
    emit(LoadingUserDataState());
    DioHelper.getDate(url: Profile, token: token).then((value) {
      print(value.data);
      user = ShopLoginModel.fromJson(value.data);
      print(user.data!.name);
      emit(SuccessGetUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUserDataState());
    });
  }

  void updateUserData(
      {required String email, required String name, required String phone}) {
    emit(LoadingUpdateUserDataState());
    DioHelper.putData(
            url: Update,
            data: {'email': email, 'name': name, 'phone': phone},
            token: token)
        .then((value) {
      print(value.data);
      user = ShopLoginModel.fromJson(value.data);
      print(user.data!.name);
      emit(SuccessUpdateUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateDataState());
    });
  }

  Search search=Search();

  void searchProduct(String text) {
    emit(LoadingSearchState());
   DioHelper.postData(url: Searchs, data:{'text':text},token: token )
        .then((value) {
      print(value.data);
      search = Search.fromJson(value.data);
      print(value.data);
      emit(SuccessSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearchState());
    });
  }
}
