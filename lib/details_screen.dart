import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hostelp/mytheme.dart';

import 'utils/widgets/rules_tile.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> urls = [
    "https://www.hostelz.com/pics/hostels/owner/big/93/2399493.jpg",
    "https://yesofcorsa.com/wp-content/uploads/2017/12/Hostel-Wallpaper-Background.jpg",
    "http://mangotreehostel.com/wp-content/uploads/2017/07/mango-tree-hostel-rio-de-janeiro-quadruple-deluxe-private-ensuite-5.jpg",
    "https://www.hostelz.com/pics/hostels/owner/big/44/2288944.jpg"
  ];

  List<String> rules = [
    "Students are not allowed after 10pm",
    "Carry you Id",
    "Limited noise after 10pm",
    "Alcohol and drug consumption is strictly prohibited"
  ];

  List<IconData> icons = [
    Icons.wifi,
    Icons.fork_left,
    Icons.headphones,
    Icons.shower
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: urls.map((url) {
                  return Builder(builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Image.network(
                          url,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: urls.map(
                (image) {
                  int index = urls.indexOf(image);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.white
                            : const Color.fromRGBO(0, 0, 0, 0.4)),
                  );
                },
              ).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Blue Sky Hotel",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("Mandallika, Lombok Tengah",
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.yellow.shade800,
                  ),
                  Text(
                    "4.9 (2,918)",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "₹2000",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: lightColorScheme.primary),
                  ),
                ),
                Text("/night", style: Theme.of(context).textTheme.displaySmall)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Description",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "A hostel is a lower-priced inn of sorts that offers basic, shared accommodations. Typically, a hostel features a large room with separate beds, a shared bathroom, and a communal kitchen. Some hostels have private rooms, but the lower-cost ones generally offer bunk beds. Hostels originated in Europe, but they’ve grown in popularity and you can find them all over the world.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Rules",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rules.length,
                  itemBuilder: (_, index) {
                    return RulesTile(rule: rules[index], ruleNo: index + 1);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Amenities",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        icons[index],
                        size: 35,
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 4),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text("Book Now"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
