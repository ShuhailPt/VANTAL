import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vantal/Admin/AdminScreens/AdminHome.dart';
import 'package:vantal/User/userScreens/homePage.dart';
import 'package:vantal/User/userScreens/otpPage.dart';


class LoginProvider extends ChangeNotifier{

  FirebaseAuth auth= FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  String VerificationId='';
  bool loader=false;

  TextEditingController phoneController=TextEditingController();
  TextEditingController OtpController=TextEditingController();

  void sendotp(BuildContext context) async {
    loader=true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader=false;
        notifyListeners();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => otpPage(),
            ));
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: OtpController.text);
    await auth.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        userAuthorized(value.user?.phoneNumber,context);
      } else {
        if (kDebugMode) {
          print("6546");
        }
     }
      });
    }

  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USERS").where("USER_PHONE",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['USER_NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["USER_PHONE"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            String uid = userId;
            print(loginUsertype);
            if (loginUsertype == "ADMIN") {

              print("cb bcb");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));

            }

            else {
              print("mxnxn");


              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homePage()));

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}