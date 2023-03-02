List<Property> allProperties = [
  Property(
    "A1 hostel",
    "Hostel",
    "Main road, Bandra",
    "https://thumbs.dreamstime.com/b/backpackers-hostel-modern-bunk-beds-dorm-room-twelve-people-inside-79935795.jpg",
    4.3,
  ),
  Property(
    "dk villa",
    "PG",
    "Hill road, Bandra",
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/280366728.jpg?k=75016b6853cbaf7403fb740a9be170124a04ad9ca70a09a6250c16c79c6f4595&o=&hp=1",
    4.8,
  ),
  Property(
    "wow hostel",
    "Hostel",
    "Hill road, Bandra",
    "https://thumbs.dreamstime.com/b/backpackers-hostel-modern-bunk-beds-dorm-room-twelve-people-inside-79935795.jpg",
    1.8,
  ),
  Property(
    "ag apt",
    "Rent",
    "Another road, Bandra",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCSAHJA8lRzGD9IcGsEUJspra4ZGkN5ymvTQ&usqp=CAU",
    2.9,
  ),
  Property(
    "wow hostel",
    "Hostel",
    "Hill road, Bandra",
    "https://thumbs.dreamstime.com/b/backpackers-hostel-modern-bunk-beds-dorm-room-twelve-people-inside-79935795.jpg",
    1.8,
  ),
  Property(
    "ag apt",
    "Rent",
    "Another road, Bandra",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCSAHJA8lRzGD9IcGsEUJspra4ZGkN5ymvTQ&usqp=CAU",
    2.9,
  ),
];

class Property {
  String name;
  String type;
  String address;
  String photo;
  double rating;

  Property(this.name, this.type, this.address, this.photo, this.rating);
}
