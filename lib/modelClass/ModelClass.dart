class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}

class Brand {
  String id;
  String BrandName;
  String Logo;

Brand(this.id,this.BrandName,this.Logo);
}
class Vehicle{

  String vId;
  String vName;
  String type;
  String company;
  String engineSize;
  String transmission;
  String seat;
  String fType;
  String mileage;
  String location;
  String price;
  String modelYear;
  String deposit;
  String brandLogo;
  List<String> vImages;

  Vehicle(this.vId,this.vName,this.type,this.company,this.engineSize,this.transmission,this.seat,this.fType,this.mileage,this.location,this.price,this.modelYear,this.deposit,this.brandLogo,this.vImages,);
}