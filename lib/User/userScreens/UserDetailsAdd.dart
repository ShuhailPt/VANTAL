import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class UserDetailsAdd extends StatelessWidget {


  const UserDetailsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blackc,width: 4)
                    ),
                    child: CircleAvatar(child: Icon(Icons.person_add_alt_1_sharp,color:Colors.grey,size: 50,),radius: 65,),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10 ),
                    child: Text("Suhail Pt",style: TextStyle(
                      color: backColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  )
                ],
              ),
            ),
            height(),
            ListTile(
              leading:Text("Email Id:",style: TextStyle(
    color: borderColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),),
              trailing: Text("suhail@gmail.com",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            ListTile(
              leading:Text("Phone Number:",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              trailing: Text("9539846263",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            ListTile(
              leading:Text("Date of Birth:",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              trailing: Text("03/02/2000",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            height(),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20),
              child: Text("Id Proof",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                          height: 160,
                          width: 400,
                    decoration: BoxDecoration(
                    border: Border.all(color:borderColor),
                    borderRadius: BorderRadius.circular(20),


    ),
    child:Center(child: Icon(Icons.add_a_photo_outlined,size: 50,color: borderColor,))
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                  },
                  child: Container(
                    height: 55,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    child: Center(child: Text("ADD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}


