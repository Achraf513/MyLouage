class Louage{
  String currentPosition;
  String destination;
  DateTime dateTime;
  int placesLeft;
  int serialNumber;
  double price;
  Louage(String currentPosition, String destination, DateTime dateTime, int placesLeft,int serialNumber, double price){
    this.currentPosition = currentPosition;
    this.destination = destination;
    this.dateTime = dateTime;
    this.placesLeft = placesLeft;
    this.serialNumber = serialNumber;
    this.price = price;
  }
}