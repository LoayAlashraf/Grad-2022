import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/mall_map_screen/mall_map_screen.dart';

import '../../../shared/variables.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
        title: Text(detailsname.toString()),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body:SafeArea(
    child: Padding(
    padding: const EdgeInsets.only(bottom: 60),
    child: ListView(
    children:[
    Card(
    elevation: 2,
    child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
    children: [

           Container(alignment: AlignmentDirectional.center,
               height: 400,
               child: Image(image: NetworkImage(detailsimage.toString()),)),

       Container(

        color: Colors.black.withOpacity(0.7),
        padding: EdgeInsets.symmetric(
          vertical: 3,
        ),
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MallMapScreen()));
          },
          icon: Icon(
            Icons.location_on_outlined,
            color: Colors.white,
          ),
          label: Text(
            'SHOW ON MAP',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]



    ),

    ),
     SizedBox(height: 20,),
     Padding(
     padding: const EdgeInsets.only(left: 20,right: 20),
     child: Row(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
     Text("Name :",style: TextStyle(
     fontSize: 16,
     height: 1.5
     ),),
    SizedBox(width: 20,),
     Flexible(
     child: Text(detailsname.toString(),style: TextStyle(
     fontSize: 16,
     height: 1.5
     ),),
     ),
     ],
     ),
     ),
     SizedBox(height: 20,),
     Padding(
     padding: const EdgeInsets.only(left: 20,right: 20),
     child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
     Text("Description :",style: TextStyle(
     fontSize: 16,
     height: 1.5
     ),),
     SizedBox(width: 20,),
     Flexible(
     child: Text(detailsdescription.toString(),style: TextStyle(
     fontSize: 16,
     height: 1.5
     ),),
     ),
     ],
     ),
     ),
    SizedBox(height: 20,),
    Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text("Cost :",style: TextStyle(
    fontSize: 16,
    height: 1.5
    ),),
    SizedBox(width: 20,),
    Flexible(
    child: Row(children: <Widget>[
    Text('${(detailscost!-(detailsdiscount!/100)*detailscost!).toStringAsFixed(2)}'+" Egp",style: TextStyle(
    fontSize: 16,height: 1.5
    ),),
    ],)
    ),
    ],
    ),
    ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Discount :",style: TextStyle(
                fontSize: 16,
                height: 1.5
            ),),
            SizedBox(width: 20,),
            Flexible(
                child: Row(children: <Widget>[
                  Text('${(detailsdiscount!-(detailscost!/100)*detailsdiscount!).toStringAsFixed(2)}'+" Egp",style: TextStyle(
                      fontSize: 16,height: 1.5
                  ),),
                ],)
            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("count :",style: TextStyle(
                fontSize: 16,
                height: 1.5
            ),),
            SizedBox(width: 20,),
            Flexible(
                child: Row(children: <Widget>[
                  Text('${detailscount}',style: TextStyle(
                      fontSize: 16,height: 1.5
                  ),),
                ],)
            ),
          ],
        ),
      ),
       ]
     ),
      ),
    ),
    );
  }
}
