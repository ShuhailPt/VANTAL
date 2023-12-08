

import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vantal/Admin/AdminScreens/AdminHome.dart';
import 'package:vantal/Admin/AdminScreens/ViewVehicle.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';

import '../modelClass/ModelClass.dart';


class MainProvider extends ChangeNotifier{
  FirebaseFirestore db = FirebaseFirestore.instance;
  Reference imgstr=FirebaseStorage.instance.ref("Images");


//brand Logo
  File? fileImage;

  //vehicle image

  File? fileVimage;


  // carousal
  int currentIndex = 0;
void change(int index){
  currentIndex = index;
  notifyListeners();

}



TextEditingController BrandNameController=TextEditingController();

Future<void> addBrand() async {
  String id= DateTime.now().microsecondsSinceEpoch.toString();
  HashMap<String,Object>addItemMap=HashMap();
  addItemMap["Brand Name"]=BrandNameController.text;
  addItemMap["ID"]=id;
  if (fileImage != null) {
    String photoId = DateTime.now().millisecondsSinceEpoch.toString();
    imgstr = FirebaseStorage.instance.ref().child(photoId);
    await imgstr.putFile(fileImage!).whenComplete(() async {
      await imgstr.getDownloadURL().then((value) {
        addItemMap["IMAGE"] = value;
        notifyListeners();
      });
      notifyListeners();
    });
    notifyListeners();
  }
  db.collection("BRANDS").doc(id).set(addItemMap);
  getBrandData();

}

 void setImage(File image){
  fileImage= image;
  notifyListeners();
  }

//image picker same for every function

 Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path,);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }


  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  List<Brand> LogoList=[];
  void getBrandData(){
    db.collection("BRANDS").get().then((value){
      print("suhailLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      if(value.docs.isNotEmpty)
        LogoList.clear();
      {
        for(var element in value.docs)
        {
          LogoList.add(Brand(element.id,element.get("Brand Name"), element.get("IMAGE")));
          notifyListeners();
          print(LogoList.length.toString());
        }
      }
    });
  }

  // clear brand
  void clearBrand(){
    BrandNameController.clear();
    fileImage=null;
  }
  // delete brand

void deleteBrand(String idd){
    db.collection("BRANDS").doc(idd).delete();
    getBrandData();
    notifyListeners();

}

  //------------------------------------------------------------------------------------------------Brand

  List<File> vehicleImageList=[];
  File? vehiclefileImage;

//dropdown
  String dropDownvalue='Car';
  void dropDownType(String ? newValue){

    print("dddddddddddd"+newValue.toString());
    dropDownvalue = newValue!;
    notifyListeners();

  }
  String dropDownvalue2='Perinthalmanna';
  void dropDownLocation(String? newValue){
    dropDownvalue2=newValue!;
    notifyListeners();
  }


//vehicle details

TextEditingController Vnameconroller=TextEditingController();
TextEditingController EngineController=TextEditingController();
TextEditingController TransmissionController=TextEditingController();
TextEditingController SeatController=TextEditingController();
TextEditingController FuelController=TextEditingController();
TextEditingController MileageController=TextEditingController();
TextEditingController companyController=TextEditingController();
TextEditingController PriceController=TextEditingController();
TextEditingController ModelController=TextEditingController();
TextEditingController depositController=TextEditingController();
String brandLogo='';

Future<void> AddVehicle(BuildContext context,String frmBt,String uId) async{
  String id =DateTime.now().microsecondsSinceEpoch.toString();
  HashMap<String,Object>vaddMap=HashMap();
  HashMap<String,Object>vImageaddMap=HashMap();
  if(frmBt=="New") {
    vaddMap["ID"]=id;
  }
  vaddMap["TYPE"]=dropDownvalue.toString();
  vaddMap["VEHICLE_NAME"]=Vnameconroller.text;
  vaddMap["COMPANY_NAME"]=companyController.text;
  vaddMap["ENGINE_SIZE"]=int.parse(EngineController.text);
  vaddMap["TRANSMISSION"]=TransmissionController.text;
  vaddMap["SEAT_CAPACITY"]=SeatController.text;
  vaddMap["FUEL_TYPE"]=FuelController.text;
  vaddMap["MILEAGE"]=int.parse(MileageController.text);
  vaddMap["LOCATION"]=dropDownvalue2.toString();
  vaddMap["PRICE"]=int.parse(PriceController.text);
  vaddMap["MODEL"]=ModelController.text;
  vaddMap["DEPOSIT"]=int.parse(depositController.text);
  vaddMap["LOGO"]=brandLogo.toString();

  if(vehicleImageList.isNotEmpty){
    int k=0;
    for(File i in vehicleImageList){
      k++;
      String imgKey="Image$k";
      String time = DateTime.now().millisecondsSinceEpoch.toString();
      imgstr = FirebaseStorage.instance.ref().child(time);
      await imgstr.putFile(i).whenComplete(() async {
        await imgstr.getDownloadURL().then((value) async {

          vImageaddMap[imgKey] = value;

        });
      });
    }
  }else {
    int j=0;
      for(var i in vehicleImagesUpdate){
        j++;
        String imgKey="Image$j";
        vImageaddMap[imgKey] = i;
      }
    }

  vaddMap["ItemImage"]=vImageaddMap;

  // if (vehiclefileImage != null && vehicleImageList.isNotEmpty) {
  //   List<String>UrlImage=[];
  //   for(File image in vehicleImageList){
  //   String photoId = DateTime.now().millisecondsSinceEpoch.toString();
  //   imgstr = FirebaseStorage.instance.ref().child(photoId);
  //   await imgstr.putFile(image!).whenComplete(() async {
  //     await imgstr.getDownloadURL().then((value) {
  //       UrlImage.add(value);
  //     });
  //       notifyListeners();
  //     });
  //     notifyListeners();
  //   }
  // vaddMap["IMAGE"] = UrlImage;
  //   notifyListeners();
  // }
  if(frmBt=="New") {
    db.collection("VEHICLE").doc(id).set(vaddMap);
    const snackBar = SnackBar(
      content: Center(
        child: Text('Success..',style:
        TextStyle(
          color: Colors.green,
        ),),
      ),
      backgroundColor: Colors.white30,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(90),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    callNextReplacement(context, AdminHomePage());

  }else
    {
      db.collection("VEHICLE").doc(uId).update(vaddMap);
      const snackBar = SnackBar(
        content: Center(
          child: Text('Updated',style:
          TextStyle(
            color: Colors.green,
          ),),
        ),
        backgroundColor: Colors.white30,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(90),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      callNextReplacement(context, ViewVehicle());


    }
  print(dropDownvalue+"duudu");
  getVehicleData(dropDownvalue);

}
  Future getvehicleImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropvehicleImage(pickedImage.path,);
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropvehicleImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      vehiclefileImage = File(croppedFile.path);
      vehicleImageList.add(vehiclefileImage!);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  
  List<Vehicle> vehicleList=[];
  void getVehicleData(String type){
    db.collection("VEHICLE").where("TYPE",isEqualTo: type).get().then((value){
      if(value.docs.isNotEmpty)
        vehicleList.clear();
      {
        for(var element in value.docs) {
          Map<String,dynamic> map=element.data();
      List<String>images=[];
          map["ItemImage"].forEach((key,value){
            images.add(value);
          });

            vehicleList.add(Vehicle(
                element.id,
                map["VEHICLE_NAME"].toString(),
                map["TYPE"].toString(),
                map["COMPANY_NAME"].toString(),
                map["ENGINE_SIZE"].toString(),
                map["TRANSMISSION"].toString(),
                map["SEAT_CAPACITY"].toString(),
                map["FUEL_TYPE"].toString(),
                map["MILEAGE"].toString(),
                map["LOCATION"].toString(),
                map["PRICE"].toString(),
                map["MODEL"].toString(),
                map["DEPOSIT"].toString(),
                map["LOGO"].toString(),
                images));
            notifyListeners();
            print(vehicleList.length.toString());
          }
      }
    });
  }

  void clearVehicle(){
     Vnameconroller.clear();
     EngineController.clear();
     TransmissionController.clear();
     SeatController.clear();
     FuelController.clear();
     MileageController.clear();
     companyController.clear();
     vehicleImageList.clear();
     ModelController.clear();
     PriceController.clear();
     depositController.clear();
     vehicleImagesUpdate.clear();
     vehicleImageList.clear();
     notifyListeners();





  }
  //update get data student
  String?vehicleGetImage;
  List<String> vehicleImagesUpdate=[];

  void updateVehicle(String id){
    db.collection("VEHICLE").doc(id).get().then((value){
      if(value.exists){
        vehicleImagesUpdate.clear();
        Map<dynamic,dynamic> vMap=value.data() as Map;
        Vnameconroller.text=vMap["VEHICLE_NAME"].toString();
        EngineController.text=vMap["ENGINE_SIZE"].toString();
        TransmissionController.text=vMap["TRANSMISSION"].toString();
        SeatController.text=vMap["SEAT_CAPACITY"].toString();
        FuelController.text=vMap["FUEL_TYPE"].toString();
        MileageController.text=vMap["MILEAGE"].toString();
        companyController.text=vMap["COMPANY_NAME"].toString();
        dropDownvalue = vMap["TYPE"].toString();
        dropDownvalue2 =vMap["LOCATION"].toString();
        brandLogo=vMap["LOGO"].toString();
        vMap["ItemImage"].forEach((key,value){
          vehicleImagesUpdate.add(value);});
        ModelController.text=vMap["MODEL"].toString();
        PriceController.text=vMap["PRICE"].toString();
        depositController.text=vMap["DEPOSIT"].toString();

        notifyListeners();

      }

    });

  }

  void deleteVehicle(String idd,String type){
    db.collection("VEHICLE").doc(idd).delete();
    getVehicleData(type);
    notifyListeners();

  }


  //---------------------------------------------------------------------------------------------------------vehicle


  //change button color
 bool carColor=false;
 bool motorCycleColor=false;


  void changeCarColor(){
    motorCycleColor=false;
    carColor=true;

    notifyListeners();


  }
  void changeMotorColor(){
    carColor=false;
    motorCycleColor=true;


    notifyListeners();


  }


//Singup

TextEditingController userNameController=TextEditingController();
TextEditingController userEmailController=TextEditingController();
TextEditingController userPhoneController=TextEditingController();

 void SignUserUp(){

  String id=DateTime.now().microsecondsSinceEpoch.toString();
  HashMap<String,Object> SIgnUserMap=HashMap();
  SIgnUserMap["ID"]=id;
  SIgnUserMap["CUSTOMER_NAME"]=userNameController.text;
  SIgnUserMap["CUSTOMER_EMAIL"]=userEmailController.text;
  SIgnUserMap["CUSTOMER_PHONE"]=userPhoneController.text;
  SIgnUserMap["SIGNUP_DATE"]=DateTime.now().toString();

  db.collection("CUSTOMER_DETAILS").doc(id).set(SIgnUserMap);

  HashMap<String,Object> userDetailsMap=HashMap();
  userDetailsMap["USER_ID"]=id;
  userDetailsMap["USER_NAME"]=userNameController.text;
  userDetailsMap["USER_PHONE"]="+91"+userPhoneController.text;
  userDetailsMap["TYPE"]="USER";
  db.collection("USERS").doc(id).set(userDetailsMap);


}
















}
