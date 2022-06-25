import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_2022/online/layout/cubit/states.dart';
import '../../../Network/end_point.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/variables.dart';
import '../../models/CartModel.dart';
import '../../models/CategoryModel.dart';
import '../../models/FavModelByUserID.dart';
import '../../models/ProductModel.dart';
import '../../modules/LayoutScreens/CategoriesScreen.dart';
import '../../modules/LayoutScreens/FavScreen.dart';
import '../../modules/LayoutScreens/ProductsScreen.dart';
import '../../modules/LayoutScreens/SettingsScreen.dart';



class ShopCubit extends Cubit<ShopState>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  int productcount=0;

  List<Widget> bottomScreen =[
    ProductsScreen(),
    CategoriesScreen(),
    FavScreen(),
    // MyCartScreen(),
     SettingsScreen(),
  ];

  void changBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  ProductModelJson? productModelJson;

  Map<int?, bool?> favorites = {};

  void getHomeData()
  {
    emit(ShopLoadingHomeDataScreen());

    DioHelperr.getData(
        url: Product,
    ).then((value) {
      // value!.data;
      // productModelJson=ProductModelJson.fromJson(value.data);
      // printFullText(productModelJson!.name.toString());
      // printFullText(productModelJson!.id.toString());

      for(int i=0;i<value!.data.length;i++){

        productModelJson =ProductModelJson.fromJson(value.data[i]);
      ProductList.add(productModelJson!);

        //printFullText(productModelJson!.name.toString());
        //printFullText(productModelJson!.id.toString());
        // ProductList.forEach((element)
        // {
        //   favorites.addAll({
        //     element.id :element.inFav,});
        //
        // });

      }
      print ('get all product done ');
      emit(ShopSuccessHomeDataScreen());}

      ).catchError((error){

      print(error.toString());

      emit(ShopErrorHomeDataScreen());});

  }


  void getCategoryProductData(CategoryId)
  {
    emit(ShopLoadingCategoryProductDataScreen());

    DioHelperr.getData(
      url: CategoryProducts,
      query: {
        "Id" : CategoryId
      }
    ).then((value) {
      ProductCategoryList.clear();
      for(int i=0;i<value!.data.length;i++){
        productModelJson =ProductModelJson.fromJson(value.data[i]);
        ProductCategoryList.add(productModelJson!);

        //printFullText(productModelJson!.name.toString());
        //printFullText(productModelJson!.id.toString());

      }
      emit(ShopSuccessCategoryProductDataScreen());}

    ).catchError((error){

      print(error.toString());

      emit(ShopErrorCategoryProductDataScreen());});

  }
  void getCategoryData()
  {
    emit(ShopLoadingCategoryDataScreen());

    DioHelperr.getData(
        url: Category,

    ).then((value) {

      for(int i=0;i<value!.data.length;i++){
        categoryModel =CategoryModel.fromJson(value.data[i]);
        CategoryList.add(categoryModel!);

        //printFullText(productModelJson!.name.toString());
        //printFullText(productModelJson!.id.toString());

      }
      emit(ShopSuccessCategoryDataScreen());}

    ).catchError((error){

      print(error.toString());

      emit(ShopErrorCategoryDataScreen());});

  }

  void changeFav(userId, productId,productName, productImage, productDiscount, productCost, producCount, is_Cart, )
  {
    // is_Active = !is_Active!;
    // if (is_Active == true) {
    //   MyColor = Colors.red;
      DioHelperr.addToFav(userId, productId,productName, productImage, productDiscount, productCost, producCount, is_Cart, is_Active);
    // } else {
    //   MyColor = Colors.grey;
    //
    // }
  }

  FavModelByUserId? favModelByUserId;

  void getfavdatabyuserid()
  {
    emit(ShopLoadingFavProductDataScreen());

    DioHelperr.getData(
      url: findfavbyuserid,
        query: {
        "UserId":2
        }).then((value)
    {
      for(int i=0;i<value!.data.length;i++){
        favModelByUserId =FavModelByUserId.fromJson(value.data[i]);
        FavModelByUserIdList.add(favModelByUserId!);
        //printFullText(favModelByUserId!.productName.toString());
        //printFullText(favModelByUserId!.productId.toString());
        }
      emit(ShopSuccessFavProductDataScreen());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorFavProductDataScreen());
    });
  }
  // void GetCartdatabyuserid()
  // {
  // emit(ShopLoadingCartProductDataScreen());
  // DioHelperr.GetCartData();
  // print('cubit cart done');
  // }

  void GetCartdatabyuserid()
  {
    emit(ShopLoadingCartProductDataScreen());

    DioHelperr.getData(
        url: FindCartByUserID,
        query: {
          "UserId":2
        }).then((value)
    {
      CartModelByUserIdList.clear();
      for(int i=0;i<value!.data.length;i++){
        cartModel =CartModel.fromJson(value.data[i]);
        CartModelByUserIdList.add(cartModel!);
        user_total+=int.parse(cartModel!.productCost.toString())-(int.parse(cartModel!.productCost!.toString())*(int.parse(cartModel!.productDiscount.toString())/100));
        //printFullText(favModelByUserId!.productName.toString());
        //printFullText(favModelByUserId0!.productId.toString());
      }
      emit(ShopSuccessCartProductDataScreen());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCartProductDataScreen());
    });
  //  return user_total;
  }


  // void addToFav(userId,productId,productImage,productDiscount,productCost,producCount,is_Cart,is_Active)
  // {
  //   DioHelperr.postData(
  //       url: addtofavoret,
  //       data: {
  //         "userId": userId,
  //         "productId": productId,
  //         "productImage": productImage,
  //         "productDiscount": productDiscount,
  //         "productCost": productCost,
  //         "producCount": producCount,
  //         "is_Cart": is_Cart,
  //         "is_Active": is_Active,}
  //         ).then((value) {
  //           favModel = FavModel.fromJson(value!.data);
  //           FAvList.add(favModel!);
  //           FAvList.forEach((element)
  //           {
  //             favorites!.addAll({element.productId: element.isActive});
  //           });
  //           print(favorites.toString());
  //         }
  //           ).catchError((error){print(error.toString());});
  // }



}



