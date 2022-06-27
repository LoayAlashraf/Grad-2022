
import 'package:grad_2022/inside/models/DiningResponse.dart';

import '../inside/models/diningmodel.dart';
import '../inside/models/gategoryidresponse.dart';
import '../inside/models/loginResponse.dart';
import '../inside/models/productResponse.dart';
import '../inside/models/userResponse.dart';
import '../online/models/AddProductToCartModel.dart';
import '../online/models/AddressModel.dart';
import '../online/models/CartModel.dart';
import '../online/models/CategoryModel.dart';
import '../online/models/CouponModel.dart';
import '../online/models/FavModel.dart';
import '../online/models/FavModelByUserID.dart';
import '../online/models/ProductModel.dart';
import '../online/models/productdetailsmodel.dart';

UserResponse? userResponse;
LoginResponse? loginResponse;
ProductResponse? productResponse;
DiningIdResponse?diningIdResponse;
List<GategoryIdResponse> productcategoryidlist = <GategoryIdResponse>[];
List<DiningIdResponse>dininglist=<DiningIdResponse>[];
int? cat_id;
int?din_id;
List<ProductModelJson> ProductList = <ProductModelJson>[];

List<ProductModelJson> ProductCategoryList = <ProductModelJson>[];

List<CategoryModel> CategoryList = <CategoryModel>[];

int? CategoryId;

CategoryModel? categoryModel;

Productdetailsmodel? productdetailsmodel;

FavModel? favModel;

int? userId,productId,loginuserId;

String? productImage,productDiscount,productCost,producCount,productName;

bool? is_Cart;

bool is_Active = false ;

List<FavModel>FAvList=<FavModel>[];

var MyColor;

int? productid;
int?diningid;
int?diningdetailsid;
DiningModel?diningModel;
String? diningname,diningimage,dininglogo,diningphonenumber,diningemail,diningwebsite;
int?dininglevel;
String? detailsimage,detailsname,detailsdescription;
int? productdetalsid,detailsdiscount,detailscount,detailscost;

List<FavModelByUserId>FavModelByUserIdList=<FavModelByUserId>[];

AddProductToCartModel? addProductToCartModel;

CartModel? cartModel;

List<CartModel>CartModelByUserIdList=<CartModel>[];

AddressModel? addressModel;

List<AddressModel>AddressModelByUserIdList=<AddressModel>[];

List<ProductModelJson>fav2list=<ProductModelJson>[];

double user_total =0;


CouponNameModel? couponNameModel;

FavModelByUserId? favModelByUserId;

int Shipping_Fee =10 ;

