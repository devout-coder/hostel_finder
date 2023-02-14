import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hostelp/features/home/widgets/ad_card.dart';
import 'package:hostelp/features/home/widgets/big_card.dart';
import 'package:hostelp/features/home/widgets/big_gap.dart';
import 'package:hostelp/features/home/widgets/mini_card.dart';
import 'package:hostelp/features/home/widgets/small_gap.dart';
import 'package:hostelp/features/home/widgets/curved_shape.dart';
import 'package:routemaster/routemaster.dart';

//name photo description book_button calender menu

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          elevation: 0,
          primary: false,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 5),
              Text("Churchgate"),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                Routemaster.of(context).push('/search');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                // do something
              },
            ),
            const CircleAvatar(
              backgroundImage: null,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const CurvedShape(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MiniCard(
                              img: Image.asset(
                                "assets/images/buildings.png",
                                height: 55,
                                width: 50,
                              ),
                              name: "Hostel",
                              onTap: () {
                                Routemaster.of(context).push('/hostel');
                              },
                            ),
                            MiniCard(
                              img: Image.asset(
                                "assets/images/pg.png",
                                height: 55,
                                width: 50,
                              ),
                              name: "PG",
                              onTap: () {
                                Routemaster.of(context).push('/hostel');
                              },
                            ),
                            MiniCard(
                              img: Image.asset(
                                "assets/images/rent.png",
                                height: 55,
                                width: 50,
                              ),
                              name: "Rent",
                              onTap: () {
                                Routemaster.of(context).push('/hostel');
                              },
                            ),
                            MiniCard(
                              img: Image.asset(
                                "assets/images/tiffin.png",
                                height: 55,
                                width: 50,
                              ),
                              name: "Tiffin",
                              onTap: () {
                                Routemaster.of(context).push('/hostel');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const BigGap(),
                    CarouselSlider(
                      items: const [
                        AdCard(
                          link:
                              "https://images.squarespace-cdn.com/content/v1/5ee642363713db37c1aa1c70/1601228943611-BHI8PAV7OM7FT5269O2M/image-asset.jpeg?format=1000w",
                        ),
                        AdCard(
                          link:
                              "https://cdn5.vectorstock.com/i/1000x1000/03/49/strawberry-ice-cream-advertisement-vector-21520349.jpg",
                        ),
                        AdCard(
                          link:
                              "https://static-cse.canva.com/blob/571368/advertisement161.jpg",
                        ),
                      ],
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),
                    const BigGap(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stuff to explore nearby",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const BigGap(),
                          Text(
                            "Hostels",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BigCard(
                                  name: "Wayne's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Stark Tower",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Bojack's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SmallGap(),
                          Text(
                            "Rent apartments",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BigCard(
                                  name: "Wayne's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Stark Tower",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Bojack's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SmallGap(),
                          Text(
                            "PGs",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BigCard(
                                  name: "Wayne's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Stark Tower",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Bojack's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SmallGap(),
                          Text(
                            "Tiffin services",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BigCard(
                                  name: "Wayne's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Stark Tower",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                BigCard(
                                  name: "Bojack's pent",
                                  img: Image.network(
                                    fit: BoxFit.contain,
                                    "https://media.istockphoto.com/id/506903162/photo/luxurious-villa-with-pool.jpg?s=612x612&w=0&k=20&c=Ek2P0DQ9nHQero4m9mdDyCVMVq3TLnXigxNPcZbgX2E=",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SmallGap(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
