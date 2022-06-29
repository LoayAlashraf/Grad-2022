import 'package:flutter/material.dart';
import '../../../Network/end_point.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/variables.dart';
import '../Buy_conform_screen/Buy_conform_screen.dart';
import '../Google_Map_Screen/Google_Map_Screen.dart';


class AddressScreen extends StatefulWidget {


  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData size = MediaQuery.of(context);
    var caption2 = Theme.of(context).textTheme.caption;
    DioHelperr.GetAddress();

    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        actions: [
          MaterialButton(onPressed: ()
          {
            if(loginuserId == null)
            {
              Tost(Msg: 'Please Login First ',color: Colors.red);
            }
            else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => Google_map_Screen()));}
          },
          child: Text('Add',style: TextStyle(color: Colors.white),),)
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: AddressModelByUserIdList.length,
                itemBuilder: (context, index) =>
                    InkWell(
                    onTap: ()
                    {
                      Label=AddressModelByUserIdList[index].label;
                      StreetName=AddressModelByUserIdList[index].streetName;
                      ApartmentNumber=AddressModelByUserIdList[index].apartmentNumber;
                      FloorNumber=AddressModelByUserIdList[index].floorNumber;
                      BuildingNumber=AddressModelByUserIdList[index].buildingNumber;
                      MobileNumber = AddressModelByUserIdList[index].mobileNumber;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BuyConformScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 150,
                        width: size.size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  children: [
                                    Text('${AddressModelByUserIdList[index].label}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),),
                                    Expanded(child: SizedBox(width: 0,)),
                                    icontext(
                                      onTap: ()
                                      async {
                                        DioHelperr.postData(url: AddressDelete,
                                        query:
                                        {
                                          "Id": AddressModelByUserIdList[index].id.toString()
                                        },).then((value) {print('address has been deleted');}).catchError((error){print(error.toString());});
                                        AddressModelByUserIdList.removeAt(index);
                                        setState(() {
                                          AddressModelByUserIdList;
                                        });
                                      },
                                      icon: Icons.remove,
                                      Textt: 'Remove',
                                    ),

                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                              child: Text('${AddressModelByUserIdList[index].streetName}',),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text('${AddressModelByUserIdList[index].apartmentNumber} ,${AddressModelByUserIdList[index].floorNumber} ,${AddressModelByUserIdList[index].buildingNumber}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Mobile: ${AddressModelByUserIdList[index].mobileNumber}'),
                            ),

                          ],
                        ),
                      ),
                    )


                ),
            ),
          ),
        ],
      ),
    );
  }
}

