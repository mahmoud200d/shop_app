import 'package:shop_app/model/favories.dart';
import 'package:shop_app/model/login_model.dart';

abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {}

class ShopLoginErrorState extends ShopLoginState {}

class ChangePasswordVisibilityState extends ShopLoginState {}

class ChangeBottomNavigationBarState extends ShopLoginState {}

class LoadingHomeDataState extends ShopLoginState {}

class SuccessHomeDataState extends ShopLoginState {}

class ErrorHomeDataState extends ShopLoginState {}

class SuccessCategoriesDataState extends ShopLoginState {}

class ErrorCategoriesDataState extends ShopLoginState {}

class ChangeFavoritesState extends ShopLoginState {}

class ChangeFavoritesSuccessState extends ShopLoginState {
  final FavoritesModel model;

  ChangeFavoritesSuccessState(this.model);
}

class ChangeErrorFavoritesState extends ShopLoginState {}

class GetFavoritesState extends ShopLoginState {}

class LoadingFavoritesState extends ShopLoginState {}

class ErrorGetFavoritesState extends ShopLoginState {}

class LoadingUserDataState extends ShopLoginState {}

class SuccessGetUserDataState extends ShopLoginState {}

class ErrorUserDataState extends ShopLoginState {}

class ShopRegisterSuccessState extends ShopLoginState {}

class ShopRegisterSuccessErrorState extends ShopLoginState {}

class ShopRegisterLoadingState extends ShopLoginState {}

class LoadingUpdateUserDataState extends ShopLoginState {}

class SuccessUpdateUserDataState extends ShopLoginState {}

class ErrorUpdateDataState extends ShopLoginState {}

class LoadingSearchState extends ShopLoginState {}

class SuccessSearchState extends ShopLoginState {}

class ErrorSearchState extends ShopLoginState {}


class LoadingGetBlogsState extends ShopLoginState {}

class SuccessGetBlogsState extends ShopLoginState {}

class ErrorGetBlogsState extends ShopLoginState {}
