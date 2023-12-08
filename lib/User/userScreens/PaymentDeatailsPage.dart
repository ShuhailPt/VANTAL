import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this for date formatting
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'bookingStatus.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
    // Set initial values for fromDate and toDate
    fromDate = DateTime.now().subtract(Duration(days: 7));
    toDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
        iconTheme: IconThemeData(
          size: 34,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            head('Select Date'),
            // Date range selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(20),


                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined,color: backColor,size: 28,),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("From",style: TextStyle(
                                color: borderColor,
                              ),),
                              InkWell(
                                onTap: (){
                                  _selectFromDate(context);
                                },
                                child: Text('${DateFormat('yyyy-MM-dd').format(fromDate)}',style: TextStyle(
                                  color: backColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18
                                ),),
                              ),
                              Text(
                                '${DateFormat('EEEE').format(fromDate)}',
                                style: TextStyle(
                                  color: backColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward,color: backColor,size: 38,),
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined,color: backColor,size: 28,),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("To",style: TextStyle(
                                color: borderColor,
                              ),),
                              Builder(
                                builder: (context) {
                                  return Row(
                                    children: [

                                      InkWell(
                                        onTap: (){
                                          _selectToDate(context);
                                        },
                                        child: Text('${DateFormat('yyyy-MM-dd').format(toDate)}',style: TextStyle(
                                          color: backColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18
                                        ),),
                                      ),

                                    ],
                                  );
                                }
                              ),
                              Text(
                                '${DateFormat('EEEE').format(toDate)}',
                                style: TextStyle(
                                  color: backColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            head('Pick-up location'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PickupLocationTff("Pick-up locatio", Icons.location_on,),
            ),
            head('Payment'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image:AssetImage("assets/icon _Card_.png") ),
                          SizedBox(width: 10,),
                          Text("xxxx xxxx xxxx 4565",style: TextStyle(
                            color: backColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,

                          ),),
                        ],
                      ),

                      Text("Change",style: TextStyle(color: blackc,
                        fontWeight: FontWeight.w700,
                      ),)

                    ],
                  ),
                ),
              ),
            ),
            head('Car rental fee'),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  border:Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/cars/n.png"),
                    width: 170,
                      height: 100,
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("RB Coupe",style: TextStyle(
                          color: backColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),),
                        SizedBox(height: 5,),
                        Text("8000/day x 2days",style: TextStyle(
                            color: borderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),),

                      ],
                    )
                  ],
                ),
              ),
            ),
            head("Price Details"),
            Column(
              children: [
                price("Car rental fee", "16000Rs"),
                price("Deposit", "5000Rs"),
                price("Delivery Charge", "500Rs"),
                total("Total Amount", "21500Rs")

              ],
            ),
            SizedBox(height: 60,)




          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 110,
        child: FloatingActionButton(
          backgroundColor: blackc,
          onPressed:(){
            showDialog(context: context,
                builder: (ctx)=>AlertDialog(

                  backgroundColor: Colors.white70,

                  title: Center(child: Column(
                    children: [
                      Text("Booking Confirmed",style: TextStyle(

                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20,),
                      Image(image: AssetImage("assets/ss2.png"),
                        width: 140,
                        height: 140,
                      ),
                    ],
                  )),

                  shadowColor: tealColor,

                  actions: <Widget>[
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusPage()));
                    }, child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color:blackc,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("OK",style: TextStyle(color: Colors.white),))))
                  ],
                ));

          },
          child: Text("Pay Now",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),),



        ),
      ),
    );
  }

  Future<void> _selectFromDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != fromDate) {
      setState(() {
        fromDate = pickedDate;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != toDate) {
      setState(() {
        toDate = pickedDate;
      });
    }
  }
}