import 'package:dio/dio.dart';

import '../../online/models/AddProductToCartModel.dart';
import '../../online/models/AddressModel.dart';
import '../../online/models/CartModel.dart';
import '../../online/models/FavModel.dart';
import '../../online/models/productdetailsmodel.dart';
import '../../shared/variables.dart';
import '../end_point.dart';

class DioHelperr
{
  static Dio? dio;
  static init()
  {
    dio=Dio(
      BaseOptions(
          baseUrl: 'https://gp2022.ekosysco.com',
          receiveDataWhenStatusError: true,
          headers:
          {
            'accept':'*/*',
          }
      ),
    );
  }

  static Future<Response?>getData({
    required String url,
     Map<String, dynamic> ?query,

  })async
  {
    return await dio?.get(
      url ,
      queryParameters: query,
    );
  }


  static Future<Response?>postData({
    required String url,
    Map<String, dynamic> ?query,
    Map<String, dynamic> ?data,
  })async
  {
    return await dio?.post(
        url ,
        queryParameters: query,
        data: data
    );
  }


  static Future <Response?> addToFav(userId,productId,productName,productImage,productDiscount,productCost,producCount,is_Cart,is_Active) async
  {
    return await DioHelperr.postData(
        url: addtofavoret,
        data:
        {
          "userId": userId,
          "productId": productId,
          "productName": productName,
          "productImage": productImage,
          "productDiscount": productDiscount,
          "productCost": productCost,
          "producCount": producCount,
          "is_Cart": is_Cart,
          "is_Active": is_Active,
        }).then(
            (value) {
              favModel = FavModel.fromJson(value!.data);
            }).catchError((error) {print(error.toString());});
  }
  static Future <Response?> addToCart(userId,productId,productName,productImage,productDiscount,productCost,producCount) async
  {
    return await DioHelperr.postData(
        url: AddProductToCart,
        data:
        {
          "userId": userId,
          "productId": productId,
          "productName": productName,
          "productImage": productImage,
          "productDiscount": productDiscount,
          "productCost": productCost,
          "producCount": producCount,
        }).then(
            (value) {
          addProductToCartModel = AddProductToCartModel.fromJson(value!.data);
          print('ProdcatHasBeenAddToCartSuccesfully');
        }).catchError((error) {print(error.toString());});
  }

  static Future<Response?>GetAddress()async
  {
    return DioHelperr.getData(
        url: FindAddresseUserId,
    query:
    {
      "UserId":2
    }
    ).then((value)
    {
      AddressModelByUserIdList.clear();
      for(int i=0;i<value!.data.length;i++){
        addressModel =AddressModel.fromJson(value.data[i]);
        AddressModelByUserIdList.add(addressModel!);}
      print('get adreess done for user id ');
    }).catchError((error){print(error.toString());});
  }

  static Future<Response?>GetDitailsData()async
  {
    return DioHelperr.getData(url: productsdetails,
        query: {
          "Id":productdetalsid
        }).then((value)
    {
      //print(value.toString());
      productdetailsmodel=Productdetailsmodel.fromJson(value!.data);
      detailsimage = productdetailsmodel!.image.toString();
      //print(detailsimage.toString());
       detailsname=productdetailsmodel!.name.toString();
      detailscost=productdetailsmodel!.cost;
      detailsdescription=productdetailsmodel!.description.toString();
      detailsdiscount=productdetailsmodel!.discount;
      detailscount=productdetailsmodel!.count;
       print (productdetailsmodel.toString());
    }).catchError((error){
      print(error.toString());});
  }
  // static Future<Response?>GetCartData()async
  // {
  //   await DioHelperr.getData(
  //       url: FindCartByUserID,
  //       query: {
  //         "UserId":2
  //       }).then((value)async
  //   {
  //     CartModelByUserIdList.clear();
  //      for(int i=0;i<value!.data.length;i++){
  //       cartModel =CartModel.fromJson(value.data[i]);
  //       CartModelByUserIdList.add(cartModel!);
  //       user_total+=int.parse(cartModel!.productCost.toString())-(int.parse(cartModel!.productCost!.toString())*(int.parse(cartModel!.productDiscount.toString())/100));
  //       //printFullText(favModelByUserId!.productName.toString());
  //       //printFullText(favModelByUserId0!.productId.toString());
  //       print('get cart data done');
  //     }        print(CartModelByUserIdList.toString());
  //
  //   }).catchError((error){
  //     print(error.toString());
  //   });
  // }




}