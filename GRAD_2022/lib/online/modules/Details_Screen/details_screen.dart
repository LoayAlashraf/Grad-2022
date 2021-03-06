import 'package:flutter/material.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/variables.dart';


class DetailsScreen extends StatelessWidget {


   // ProductModelJson product=new ProductModelJson();
   //
   // DetailsScreen(@required int? index)
   // {
   //
   //   product=ProductList[index!];
   // }
  // DetailsScreen({required this.Detailsimage})
  // {
  //   DioHelperr.GetDitailsData(detailsimage);
  // }
  //
  // final String Detailsimage;



  @override
  Widget build(BuildContext context) {

              return Scaffold(
                  backgroundColor: kPrimaryColor,
                  appBar: detailsAppBar(context),
                  body:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultpadding * 1.5,
                          ),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    ImageforDetailsScreen(
                                      size: MediaQuery.of(context).size,
                                      image: detailsimage.toString(),
                                    ),
                                    if(detailsdiscount !=0)
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
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
                                child: Text(detailsname.toString(),
                                  style: Theme.of(context).textTheme.headline6 ,),
                              ),
                              Row(
                                children: [
                                  Text("price ="'${(detailscost!-(detailsdiscount!*detailscost!)/100).toStringAsFixed(2)}'
                                    ,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: kSecoundryColor,
                                    ),
                                  ),
                                  Spacer(),
                                  icontext(
                                      Textt: 'Add to My Cart',
                                      icon: Icons.add_shopping_cart,
                                      onTap: ()
                                      {
                                        if(loginuserId == null){
                                          Tost(Msg: 'Please Login First ',
                                            color: Colors.red);}
                                        else {
                                          DioHelperr.addToCart(
                                              userId = loginuserId,
                                              productId = productdetalsid,
                                              productName = detailsname,
                                              productImage = detailsimage,
                                              productDiscount =
                                                  detailsdiscount.toString(),
                                              productCost =
                                                  detailscost.toString(),
                                              producCount =
                                                  detailscount.toString());
                                        }}),
                                ],
                              ),
                              SizedBox(height: kDefaultpadding,),
                              if(detailsdiscount !=0)
                                Text("Old price ="'${detailscost}'
                                ,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: kSecoundryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
                          padding: EdgeInsets.symmetric(horizontal: kDefaultpadding*1.5, vertical: kDefaultpadding/2,),
                          child: Text(detailsdescription.toString(),
                            style: TextStyle(color: Colors.white,
                              fontSize: 19.0,),
                          ),
                        ),
                      ],
                    ),
                  )
              );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultpadding),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        } ,
      ),
      centerTitle: false,
      title: Text('Return',
        style :Theme.of(context).textTheme.bodyText2,),
    );
  }

  Widget ImageforDetailsScreen( {Size? size, String? image}) => Container(
    margin: EdgeInsets.symmetric(vertical: kDefaultpadding),
    height: size!.width * 0.8,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: size.width * 0.7,
          width: size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        // Image.asset(image,
        //   height: size.width * 0.75,
        //   width: size.width * 0.75,
        //   fit: BoxFit.cover,
        //
        // ),
        Image.network(image!,
          height:size.width * 0.75 ,
          width: size.width * 0.75,
          fit: BoxFit.cover,)
      ],
    ),
  );
}



