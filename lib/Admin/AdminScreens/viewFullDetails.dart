import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class ViewFullDetails extends StatelessWidget {


  const ViewFullDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var heightt=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: Rtext("Audi", " RB Coupe"),
            ),


            Center(child: Image(image: AssetImage("assets/cars/n.png"),width: 300,height: 140,)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height:heightt/1.4,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color:borderColor),
                    borderRadius: BorderRadius.circular(20),


                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: borderColor,width: 2)
                              ),
                              child: CircleAvatar(
                                radius: 50,

                                backgroundImage: AssetImage("assets/user2.jpeg"),
                                // child:Image.asset("assets/user2.jpeg") ,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Suhail",style:TextStyle(color:borderColor,fontWeight: FontWeight.bold,fontSize: 18),),
                          ],
                        ),
                        height2(),

                        roww("DOB :","02/03/200" ),
                        SizedBox(height: 9,),
                        roww("Email Id :","shuhailpt@gmail.com" ),
                        SizedBox(height: 9,),
                        roww("Phone :","9569865632" ),
                        SizedBox(height: 9,),
                        roww("No of Days :","2" ),
                        SizedBox(height: 9,),
                        roww("Payment Status :","Paid" ),
                        SizedBox(height: 9,),
                        roww("Booking Date :","01/25/2023" ),
                        SizedBox(height: 9,),
                        roww("Pick-up Date :","01/25/2023" ),
                        SizedBox(height: 9,),
                        roww("Return Date :","01/25/2023" ),

                      ],
                    ),
                  ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),

                    onPressed: (){}, child: Text("Start Rental",style: TextStyle(
                  color: backColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),)),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 15),
            //   child: Center(
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
            //       },
            //       child: Container(
            //         height: 55,
            //         width: 100,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Colors.black87,
            //         ),
            //         child: Center(child: Text("ADD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),

    );
  }
}


