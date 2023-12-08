

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/User/userScreens/rentalStatus.dart';
import 'package:vantal/User/userScreens/viewProfile.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'UserDetailsAdd.dart';
import 'VehicleDetailsPage.dart';
import 'ViewAll.dart';
import 'loginPage.dart';

class homePage extends StatelessWidget {
   homePage({Key? key}) : super(key: key);

  List<String> Carimage=[
    "assets/cars/m.png",
    "assets/cars/n.png",
    "assets/cars/b.png",
    "assets/cars/8.png",
    "assets/cars/y.png",
    "assets/cars/w.png",
    "assets/cars/op.png",
    "assets/cars/l.png",
    "assets/cars/r.png",
    "assets/cars/8.png",
    "assets/cars/m.png",
    "assets/cars/n.png",
  ];
  List<String> CarLogo=[
    "assets/CarLogo/mini.png",
    "assets/CarLogo/kia.png",
    "assets/CarLogo/Land.png",
    "assets/CarLogo/audi.png",
    "assets/CarLogo/bmw.png",
    "assets/CarLogo/hon.png",
    "assets/CarLogo/hun.png",
    "assets/CarLogo/merc.png",


  ];
  List<String> user=[
    "assets/us.jpeg"
  ];


  List<String> Company=[
    "Audi",
    "Toyota",
    "Nissan",
    "Audi",
    "Porsche",
    "Jeep",
    "Mini Cooper",
    "Lamborghini",
    "Range Rover",
    "Audi",
    "Toyota",
    "Nissan",
  ];
  List<String> name=[
    "RB Coupe",
    "Supra",
    "RB Vitta",
    "911",
    "Carrera",
    "Wrangler",
    "RB Coupe",
    "Supra",
    "RB Vitta",
    "911",
    "Carrera",
    "Wrangler",

  ];
  List<String> price=[

    "5252",
    "1002",
    "9564",
    "8562",
    "7596",
    "8963",
    "5252",
    "1002",
    "9564",
    "8562",
    "7596",
    "8963",


  ];

  @override
  Widget build(BuildContext context) {
    String dropDownvalue='Perinthalmanna';
    var location = [
      'Perinthalmanna',
      'Elamkulam',
      'Elad',
      'Kunnakkavu',
      'Cherukara',
    ];
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: borderColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,size: 36),
        backgroundColor: tealColor,
        actions: [
          InkWell(
            onTap: (){
              FirebaseAuth auth=FirebaseAuth.instance;
              auth.signOut();
              callNextReplacement(context, login());

            }
              ,
              child: Icon(Icons.power_settings_new_sharp))],

        // leading: Icon(Icons.menu,color: blackc,
        // size: 30,
        // ),
        title: const Text("VANTAL",
        
        
        

        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: Colors.white,
        ),
        ),
        centerTitle:true,
      ),
      drawer: Drawer(
        elevation: 16,
              width: 220,
              backgroundColor: borderColor,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: tealColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile()));
                        },
                        child: Container(
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
                      ),
                      SizedBox(height: 10,),
                      Text("Suhail Pt",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),


                    ],
                  ),
                )),
            ListTile(
              leading: Icon(Icons.person_add_alt_1_sharp),
              title: Text("Add User Details"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailsAdd()));
              },

            ),
            ListTile(

              leading: Icon(Icons.crisis_alert_rounded),
              title: Text("Rental Status"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>rentalStatus()));
              },

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){},

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){},

            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: (){
                alert(context);

              },

            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(),
            Center(
              child: Container(
                height: 45,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Vehicle",hintStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  ),

                ),
              ),
            ),


            height(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          val.changeCarColor();
                          val.getVehicleData("Car");
                        },
                        child: Container(
                          height: 45,
                          width: widthh/(2.5),
                          decoration: BoxDecoration(
                            color: tealColor,
                            borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(

                                  offset: const Offset(1,3),
                                  color: lghtblack,
                                  blurRadius: 2
                                )
                              ]

                          ),

                          child: const Center(child: Text("Cars",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,

                          ),)),

                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          val.changeMotorColor();
                          val.getVehicleData("Motorcycle");
                        },
                        child: Container(
                          height: 45,
                          width: widthh/(2.5),
                          decoration: BoxDecoration(
                            color: const Color(0xffE5E2E2),
                            borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(

                                  offset: const Offset(1,3),
                                  color: lghtblack,
                                  blurRadius: 2
                                )
                              ]

                          ),

                          child: const Center(child: Text("Motorcycles",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,

                          ),)),

                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20 , top: 20),
              child: Text("Location"
                ,style: TextStyle(
                  color: lghtblack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownButton(
                  value: dropDownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: location.map((String location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (String ?newValue){

                  }),
            ),
            height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text:TextSpan(
                    text: "Most",
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: blackc,
                    ),

                    children: const <TextSpan>[
                      TextSpan(
                        text: "  Popular",
                        style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black38,
                      )
                      )
                    ]


                  ),

                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll()));

                    },
                    child: Text("View all",style:
                      TextStyle(
                        color: tealColor
                      ),),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(
              height: 250,
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return ListView.builder(
                    itemCount: 6,
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context,index)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(

                        children: [

                          Container(
                            height: 230,
                            width: 200,
                            decoration: BoxDecoration(
                                color: tealColor,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage(Carimage[index],),scale: .5),
                                boxShadow: [
                                  BoxShadow(


                                      offset: const Offset(2,4),
                                      color: lghtblack,
                                      blurRadius: 2
                                  )
                                ]


                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8,left: 8),
                                          child: Text(Company[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8,top: 8),
                                          child: Text(price[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        )

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8,),
                                          child: Text(name[index],style: TextStyle(color: Colors.white70,),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8,),
                                          child: Text("/day",style: TextStyle(color: Colors.white70,),),
                                        )
                                      ],
                                    ),
                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8,bottom: 8),
                                      child: Text("Model",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),),
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                                              },
                                      child: Container(
                                        height: 39,
                                        width: 105,
                                        decoration: const BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text("Rent now",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                ),),
                                              SizedBox(width: 2,),
                                              Icon(Icons.arrow_right_alt_outlined,color: Colors.white,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),

                          ),
                        ],
                      ),
                    );


                  }
                  );
                }
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              RichText(text:TextSpan(
              text: "Top",
                  style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: blackc,
                  ),

                  children: const <TextSpan>[
                    TextSpan(
                        text: "  Brands",
                        style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.black38,
                        )
                    )
    ]
              ),
              )


                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 125,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CarLogo.length,

                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 120,
                      width: 140,
                      decoration: BoxDecoration(
                        color: backColor2,
                          borderRadius:BorderRadius.circular(15) ,
                          image: DecorationImage(image: AssetImage(CarLogo[index],),scale: 12),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2,4),
                                color: lghtblack,
                                blurRadius: 2
                            )
                          ]

                      ),
                    );
                  }

              ),
            ),

            height(),







          ],
        ),
      ),
    );
  }

  alert(BuildContext context){
    showDialog(context: context, builder: (ctx)=>AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure ?"),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Container(
          height: 40,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Center(child: Text("No",style: TextStyle(color: backColor),)),
        )),
        TextButton(onPressed: (){
          FirebaseAuth auth=FirebaseAuth.instance;
          auth.signOut();
          print("hellooo");
          // callNextReplacement(context, login());
          //
          //
          // // callNextReplacement(context, login());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => login()),
          (Route<dynamic> route) => false,
          );
        }, child: Container(
          height: 40,
          width: 65,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: teal2,
          ),
          child: Center(child: Text("Yes",style: TextStyle(color: backColor),)),
        )),

      ],

    ));

  }

}

