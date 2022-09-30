import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'onboarding.dart';

class Welcome extends StatelessWidget {
   Welcome({Key? key}) : super(key: key);

 bool validPhoneNumber = false;

  void showBottomSheet(context) {
    showModalBottomSheet(

      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, StateSetter myState) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
          ),
          child: Column(
            children: [
              Text(
                'Login',
                style: MyTextStyles.sectionTitleSmallPrimary,
              ),
              Text(
                'Enter your phone number to process',
                style: MyTextStyles.regularBlack,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autofocus: true,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixText: '+92',
                  labelText: 'Phone Number',
                ),
                onChanged: (value){
                  if(value == 10 ){
                   myState((){
                     validPhoneNumber = true;
                   });
                  }else {
                    myState((){
                      validPhoneNumber = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: validPhoneNumber ? false: true,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: validPhoneNumber? lightColor : primaryText),
                        onPressed: () {},
                        child: Text(
                         validPhoneNumber? 'continue' : 'ENTER PHONE NUMBER ',
                          style: MyTextStyles.subHeadingWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'skip',
                  style: MyTextStyles.headingSmallPrimary,
                ),
              ),
            ],
          ),
          Expanded(child: OnBoarding()),
          // SizedBox(height: 10,),
          Text('Ready to order from your nearest shop'),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Delivery Location'),
          ),

          TextButton(
              onPressed: () {
                showBottomSheet(context);
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Already a costumer?  ',
                      style: MyTextStyles.regularBlack),
                  TextSpan(
                      text: 'Login', style: MyTextStyles.headingSmallPrimary)
                ]),
              )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
