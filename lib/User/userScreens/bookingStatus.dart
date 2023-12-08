import 'package:flutter/material.dart';
import 'package:vantal/refactoring/myColor.dart';
import '../../refactoring/widget.dart';

class StatusPage extends StatelessWidget {

  StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: Rtext("Audi", " RB Coupe"),
            ),


            Image(image: AssetImage("assets/cars/n.png")),
            SizedBox(height: 2.0), // Adjust the spacing as needed
            height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(20),


                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: AssetImage("assets/CarLogo/audi.png",),
                            width: 120,
                            height: 50,

                          ),
                          SizedBox(width: 7,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("RB Coupe",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              Text("Kunnapally",style: TextStyle(color: Colors.white70,fontSize: 14),)
                            ],
                          ),


                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle,color: Colors.white,size: 17,),
                          SizedBox(width: 6,),
                          Text("Mon-Sun 8:00-5:30",style: TextStyle(fontSize: 12,color: Colors.white),),
                          SizedBox(width: 30,),
                          Icon(Icons.phone,color: Colors.white,size: 17,),
                          SizedBox(width: 6,),
                          Text("9539846263",style: TextStyle(fontSize: 12,color: Colors.white),)


                        ],
                      )

                    ],
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
