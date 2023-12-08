import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'viewFullDetails.dart';

class ViewBooking extends StatelessWidget {


  const ViewBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                height: 160,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color:borderColor),
                  borderRadius: BorderRadius.circular(20),


                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text("15/11/2023",style:TextStyle(color:borderColor,fontWeight: FontWeight.bold),),
                      ],),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Audi",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text("RB Coupe",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pick-up Date",style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                              Text("25/05/2023",style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Return Date",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              Text("25/05/2023",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewFullDetails()));

                            },
                            child: const Text("View Full Details",style:

                            TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            ),),
                          ),
                          // Image(image: AssetImage("assets/cars/n.png",),
                          //   width: 190,
                          //   height: 85,
                          // ),

                          InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                            },
                            child: Container(
                              height: 45,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black87,
                              ),
                              child: const Center(child: Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                            ),
                          ),

                        ],)
                    ],
                  ),
                )
            ),
          ),

        ],
      ),

    );
  }
}


