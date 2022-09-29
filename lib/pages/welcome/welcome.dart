import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import 'onboarding.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(onPressed: (){}, child: Text('skip', style: MyTextStyles.headingSmallPrimary,),),
            ],
          ),
          Expanded(child: OnBoarding()),
          SizedBox(height: 10,),
          Text('Ready to order from your nearest shop'),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: Text('Delivery Location'),),
          SizedBox(height: 10,),
          TextButton(onPressed: (){}, child: RichText(text: TextSpan(children: [
            TextSpan(text: 'Already a costumer?  ',style: MyTextStyles.regularBlack),
            TextSpan(text: 'Login', style: MyTextStyles.headingSmallPrimary)
          ]),)),
          SizedBox(height: 10,),
        ],
      ),
    ));
  }
}
