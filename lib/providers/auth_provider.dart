import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:karyana_wala/services/user_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/routes.dart';
import '../widgets/showSnackbar.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String smsOtp, verificationId;
  String error = '';
  final UserServices _userServices = UserServices();



  Future<void> verifyPhone (BuildContext context , String number) async {

    verificationCompleted(PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
    }

    verificationFailed(FirebaseAuthException e) {
      showSnackBar(context, e.message!);
    }

    smsOtpSend(String verId, int? resendToken) async {
      verificationId = verId;

      smsOtpDialog(context, number);

    }

    try{
      _auth.verifyPhoneNumber(
        phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: smsOtpSend,
          codeAutoRetrievalTimeout: (String verId){
          verificationId = verId;
          }
      );

    }catch(e){
      print(e);

    }
  }

  Future smsOtpDialog(BuildContext context, String number){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Column(
            children: const [
              Text('Verify Code'),
              SizedBox(height: 6,),
              Text('Enter 6 digit OTP recieved as sms'),
            ],
          ),
          content: Container(
            height: 85,
            child: TextField(textAlign: TextAlign.center, keyboardType: TextInputType.number, maxLength: 6, onChanged: (value){
              smsOtp = value;
            },),
          ),
          actions: [
            TextButton(onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsOtp);

            final User? user =     (await _auth.signInWithCredential(credential)).user;

            _createUser(id: user!.uid, number:  user.phoneNumber);

            if(user != null ){
              Get.back();
              Get.offAllNamed(MyRoutes.getHomeRoute());
            }else {
              print('login failed');
            }

              }catch (e){
                error = 'invalid otp';
                notifyListeners();
                print (e.toString());
                Get.back();
              }
            }, child: const Text('Done'))
          ],
        );
      }
    );
  }

  void _createUser({required String id, String? number}) {
    _userServices.createUserData({
      "id": id,
      "number": number,
    });
  }
}
