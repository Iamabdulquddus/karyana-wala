import 'package:flutter/material.dart';
import 'package:karyana_wala/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'onboarding.dart';

class Welcome extends StatelessWidget {
   const Welcome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    var validPhoneNumber = false;
    var phoneNumberController = TextEditingController();

    void showBottomSheet(context) {
      showModalBottomSheet (

        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, StateSetter myState) => Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: auth.error == 'Invalid OTP' ? true : false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(auth.error, style: MyTextStyles.regularBlack,),
                        SizedBox(height: 4,),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Login',
                  style: MyTextStyles.sectionTitleSmallPrimary,
                ),
                Text(
                  'Enter your phone number to process',
                  style: MyTextStyles.regularBlack,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  autofocus: true,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
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
                    if(value.length == 10){
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: validPhoneNumber ? false : true,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: validPhoneNumber ?  primaryText : lightColor),
                          onPressed: () {
                            String number = "+92${phoneNumberController.text}";
                            auth.verifyPhone(context, number).then((value) {
                              phoneNumberController.clear();
                            });
                          },
                          child: Text(
                            validPhoneNumber ? 'continue' : 'ENTER PHONE NUMBER ',
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

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'skip',
                  style: MyTextStyles.headingSmallPrimary,
                ),
              ),
            ],
          ),
          const Expanded(child: OnBoarding()),
          // SizedBox(height: 10,),
          const Text('Ready to order from your nearest shop'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Delivery Location'),
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
