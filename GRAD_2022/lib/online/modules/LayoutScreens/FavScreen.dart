import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Network/end_point.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/FavModelByUserID.dart';
import '../Details_Screen/details_screen.dart';

class FavScreen extends StatefulWidget {

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData size = MediaQuery.of(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=>ShopCubit()..getfavdatabyuserid())
    ],
      child: BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {},
        builder: (context,state){
          return Scaffold(
            body: ConditionalBuilderRec(
                condition: FavModelByUserIdList != null,
                builder:(context)=> FavWidget(FavModelByUserIdList,context,size),
                fallback:(context) => Center(child: CircularProgressIndicator())
      ),
          );
          },
      )
    );

  }

  Widget FavWidget(FavModelByUserIdList,context,size) => Column(

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
              itemCount: FavModelByUserIdList.length,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: () async {
                      productdetalsid=productid=FavModelByUserIdList[index]!.productId;
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
                                            '${FavModelByUserIdList[index].productImage}',
                                            fit: BoxFit.cover,
                                          ),
                                          if(int.parse(FavModelByUserIdList[index].productDiscount) !=0)
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
                                          '${FavModelByUserIdList[index].productName.toString()}',
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlign: TextAlign.right,
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,


                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultpadding * 1.2, //30 px padding
                                            vertical: kDefaultpadding / 5, // 5 px padding
                                          ),
                                          child:
                                          Center(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              textBaseline: TextBaseline.alphabetic,
                                              children: [
                                                Text('Price ='),
                                                Text(
                                                    '${(double.parse(FavModelByUserIdList[index]!.productCost)-((double.parse(FavModelByUserIdList[index]!.productDiscount)*double.parse(FavModelByUserIdList[index]!.productCost))/100)).toStringAsFixed(2)}',
                                                style: TextStyle(color: Colors.blue),
                                                ),
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
                                            ),
                                          ),
                                        ),
                                        if(int.parse(FavModelByUserIdList[index].productDiscount) != 0)
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
                                              Text('${FavModelByUserIdList[index].productCost.toString()}',
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
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  icontext(
                                      Textt: 'Remove',
                                      icon: Icons.remove_shopping_cart,
                                      onTap: ()
                                      async {
                                        //print('productid = ${FavModelByUserIdList[index].productId}');
                                        await DioHelperr.postData(
                                          url: DeleteByProductIdAndUserId,
                                          query:
                                          {
                                            "id": FavModelByUserIdList[index]
                                                .productId,
                                            "UserId": loginuserId
                                          },
                                        ).then((value) {
                                          print('remove done');
                                        }).catchError((error) {
                                          print(error.toString());
                                        });
                                        FavModelByUserIdList.removeAt(index);
                                        setState(() {
                                          FavModelByUserIdList;
                                        });
                                      }),
                                  SizedBox(width: 7,),
                                  icontext(
                                      Textt: 'Add to My Cart',
                                      icon: Icons.add_shopping_cart,
                                      onTap: ()
                                      {
                                        DioHelperr.addToCart(
                                            userId=loginuserId,
                                            productId=FavModelByUserIdList[index].productId,
                                            productName=FavModelByUserIdList[index].productName,
                                            productImage=FavModelByUserIdList[index].productImage,
                                            productDiscount=FavModelByUserIdList[index].productDiscount,
                                            productCost=FavModelByUserIdList[index].productCost,
                                            producCount=FavModelByUserIdList[index].producCount).then(
                                                (value) {print('add to cart done ');}
                                            ).catchError((error){print(error.toString());});
                                      }),
                                  SizedBox(width: 7,)


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
    ],
  );
}
