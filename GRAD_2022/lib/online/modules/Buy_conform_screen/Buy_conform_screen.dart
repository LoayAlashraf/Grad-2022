import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:grad_2022/Network/remote/dioo_helper.dart';
import 'package:grad_2022/shared/components/components.dart';

import '../../../Network/end_point.dart';
import '../../../shared/variables.dart';
import '../Address_Screen/Address_Screen.dart';


class BuyConformScreen extends StatefulWidget {



  @override
  State<BuyConformScreen> createState() => _BuyConformScreenState();
}
class _BuyConformScreenState extends State<BuyConformScreen> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  paymentmetod? paymethod = paymentmetod.cash;






  @override
  Widget build(BuildContext context) {
    // String? paymethod;

    MediaQueryData size = MediaQuery.of(context);
    var caption2 = Theme.of(context).textTheme.caption;
    return Scaffold(
      appBar: AppBar(
        title: Text('Conform Buying'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,15,15,0),
              child: Container(
                height: size.size.height * .17,
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
                        Text('${Label}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text('${StreetName}',),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text('${ApartmentNumber}, ${FloorNumber}, ${BuildingNumber}',),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mobile: ${MobileNumber}'),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
                },
                  child: Text('Change Address',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                          ),
                  ),

                   ),
              ),
            ),
            //MyStatefulWidget(),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Cash'),
                  leading: Radio<paymentmetod>(
                    value: paymentmetod.cash,
                    groupValue: paymethod,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        paymethod = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Credit Card'),
                  leading: Radio<paymentmetod>(
                    value: paymentmetod.credit,
                    groupValue: paymethod,
                    onChanged: (value)
                    {
                      print(value);
                      setState(() {
                    //    _character = value;
                        paymethod = value;
                      });
                    },

                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: false,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.deepOrange,
                ),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: const Text(
                    'Buy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'halter',
                      fontSize: 14,
                      package: 'flutter_credit_card',

                    ),
                  ),
                ),
                onPressed: () {
                  if (loginuserId == null){
                    Tost(Msg: 'Please Login First ',
                      color: Colors.red);}
                  else{
                  if( paymethod == paymentmetod.cash )
                    {
                      DioHelperr.postData(url: User_CartAdd,
                          data:
                          {

                            "userId": loginuserId,
                            "subtotal": user_total,
                            "shipFee": Shipping_Fee,
                            "discount": discount,
                            "total": total
                          }).then((value)
                      {
                        print('total bill = ${total?.toStringAsFixed(2)}');
                      }).catchError((error)
                      {print(error.toString());
                      });
                      DioHelperr.postData(url: User_PayAdd,
                          data:
                          {
                            "userId": loginuserId,
                            "typeOfPay": paymethod.toString(),
                            "number": CartModelByUserIdList.length,
                            "expired": "string",
                            "time": DateTime.now().toString(),
                            "is_Payed": true
                          } ).then((value)
                      {
                        print('your order in ur way');
                        Tost(Msg: 'Your Order Into Your Way',
                            color: Colors.green);
                      }).catchError((error)
                      {
                        print(error.toString());
                        Tost(Msg: 'Some thing wrong please try again',
                            color: Colors.red);
                      });


                    }
                  if( paymethod == paymentmetod.credit )
                  {
                    if (formKey.currentState!.validate()) {
                      print('valid!');
                    } else {
                      print('invalid!');
                    }

                  }}

                },
              ),
            ),

          ],
        ),
      ),
    );
  }


  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
enum paymentmetod { cash, credit }


