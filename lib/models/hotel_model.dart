class Hotel {
  String imageUrl;
  String name;
  String address;
  String description;
  double rate;
  int price;


  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.description,
    this.rate,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel Diana',
    address: 'İzmir, Turkey',
    description: "Amazing hotel at Izmir, Turkey have a good swimming pool.",
    rate: 4.4,
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Miami',
    address: 'Miami, Florida, USA',
    description: "Amazing hotel at Miami, USA near the ocean.",
    rate: 4.3,
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel Bali',
    address: 'Bali, Indonesia',
    description: "Amazing hotel at Bali, Indonesia really cheap and exotic.",
    rate: 4.8,
    price: 240,
  ),
];