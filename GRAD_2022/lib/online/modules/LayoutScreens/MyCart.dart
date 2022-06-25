import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_2022/online/models/CouponModel.dart';
import '../../../Network/end_point.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/items_number.dart';
import '../../../shared/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../Buy_conform_screen/Buy_conform_screen.dart';
import '../Details_Screen/details_screen.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  var CouponCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CartModelByUserIdList.clear();
    MediaQueryData size = MediaQuery.of(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) =>
          ShopCubit()
            ..GetCartdatabyuserid())
        ],
        child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text('My Cart'),),
              body: Column(

                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: kDefaultpadding / 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70.0),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: CartModelByUserIdList.length,
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: () async {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         DetailsScreen(
                                  //       product: products[itemIndex],
                                  //     ),
                                  //   ),
                                  // );
                                  productdetalsid=productid=CartModelByUserIdList[index].productId;
                                  await DioHelperr.GetDitailsData();
                                  navigateTo(context, DetailsScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                                  child: Container(
                                    height: 210,
                                    width: size.size.width * .8,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                        children : [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: SizedBox(
                                                  height: size.size.height * .2,
                                                  width: size.size.width * .25,
                                                  child: Stack(
                                                    alignment: AlignmentDirectional.bottomStart,
                                                    children: [
                                                      Image.network(
                                                        CartModelByUserIdList[index].productImage.toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      if(int.parse(CartModelByUserIdList[index].productDiscount.toString()) !=0)
                                                        Container(
                                                          color: Colors.red,
                                                          padding: EdgeInsets.symmetric(
                                                            horizontal: 5.0,
                                                          ),
                                                          child: Text('DISCOUNT',
                                                            style: TextStyle(
                                                              fontSize: 8.0,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      CartModelByUserIdList[index].productName.toString(),
                                                      style: Theme.of(context).textTheme.bodyText1,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: kDefaultpadding * 1.2, //30 px padding
                                                        vertical: kDefaultpadding / 5, // 5 px padding
                                                      ),
                                                      child:
                                                      Center(child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        textBaseline: TextBaseline.alphabetic,
                                                        children: [
                                                          Text('Price ='),
                                                          Text('${(double.parse(CartModelByUserIdList[index].productCost.toString())-((double.parse(CartModelByUserIdList[index].productDiscount.toString())/100)*double.parse(CartModelByUserIdList[index].productDiscount.toString()))).toStringAsFixed(2)}',
                                                            style: TextStyle(color: Colors.blue,),),
                                                          Text(
                                                            'EGP',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9.0 ,
                                                                color: Colors.black54
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                    ),
                                                    if(int.parse(CartModelByUserIdList[index].productDiscount.toString()) !=0)
                                                      Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: kDefaultpadding * 1.2, //30 px padding
                                                        vertical: kDefaultpadding / 5, // 5 px padding
                                                      ),
                                                      child:
                                                      Center(child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        textBaseline: TextBaseline.alphabetic,
                                                        children: [
                                                          Text('Old Price ='),
                                                          Text('${CartModelByUserIdList[index].productCost.toString()}',
                                                            style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                                                          Text(
                                                            'EGP',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9.0 ,
                                                                color: Colors.black54
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      )
                                                        ,
                                                      ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: ItemsNumber(),
                                              ),
                                              Spacer(),
                                              icontext(
                                                  Textt: 'Remove',
                                                  icon: Icons.remove_shopping_cart,
                                                  onTap: ()
                                                  {
                                                    DioHelperr.postData(
                                                      url: CartDelete,
                                                      query:
                                                      {
                                                        "Id": CartModelByUserIdList[index].id
                                                      },
                                                    ).then((value) {print('delete product from cart done sucsfully');}).catchError((error){print(error.toString());});
                                                    //DioHelperr.GetCartData();
                                                  }),
                                              SizedBox(width: 7,),
                                              // icontext(
                                              //     Textt: 'Add to wish list',
                                              //     icon: Icons.favorite,
                                              //     onTap: () {}),


                                            ],
                                          ),
                                        ]
                                    ),

                                  ),
                                ),


                              ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [

                        Text('Subtotal :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('${user_total}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [

                        Text('Shipping Fee :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('10.00',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [

                        Text('Discount :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('${((coupon*user_total)/100)}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [

                        Text('Total :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('${(user_total-((coupon*user_total)/100))}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                      ),
                      controller: CouponCode,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: ()
                          async {
                            await DioHelperr.getData(
                                url:DiscountCoupon,
                            query:
                            {
                              "CouponName" : CouponCode
                            }
                            ).then((value)
                            {
                              couponNameModel = CouponNameModel.fromJson(value!.data);
                              coupon = couponNameModel!.discount as double;

                            }
                            ).catchError((error){print(error.toString());});
                          },
                          color: Colors.deepOrange,
                          child: Text('APPLY',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => BuyConformScreen()));
                        },
                        color: Colors.deepOrange,
                        child: Text('Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),


            );
          },
        )
    );
  }
}
