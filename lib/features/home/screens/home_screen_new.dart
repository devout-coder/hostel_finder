import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hostelp/features/home/widgets/ItemCard.dart';
import 'package:routemaster/routemaster.dart';
import 'package:hostelp/features/home/widgets/service_display_card.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  TextEditingController searchController = TextEditingController();

  String? mainArea = '';
  String? subArea = "";
  late Position _currentPosition;

  Future<Position> _determinePosition() async {
    // bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      debugPrint(place.toString());
      setState(() {
        mainArea = place.thoroughfare;
        subArea = "${place.subLocality}, ${place.locality}";
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentfocus = FocusScope.of(context);
        if (!currentfocus.hasPrimaryFocus) {
          currentfocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 150.0,
            height: 50,
            child: InkWell(
              onTap: () async {
                if (mainArea == '' && subArea == '') {
                  _currentPosition = await _determinePosition();
                  await _getAddressFromLatLng(_currentPosition);
                }
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24))),
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(children: [
                            Text(
                              'Your location',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      mainArea ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      subArea ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 7),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainArea ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          subArea ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Routemaster.of(context).push('/notifications');
                },
                icon: const Icon(Icons.notifications_none)),
            IconButton(
              onPressed: () {
                Routemaster.of(context).push('/profile');
              },
              icon: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                    )),
                                hintText: 'Search here',
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_list_bulleted_rounded),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: [
                      Text(
                        'book',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                      ),
                      Text(
                        ' now',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    ServiceDisplayCard(
                      icon: Icons.apartment_rounded,
                      title: 'Hostel',
                      onTap: () {
                        Routemaster.of(context).push('/hostel');
                      },
                    ),
                    ServiceDisplayCard(
                      icon: Icons.bed_rounded,
                      title: 'PG',
                      onTap: () {
                        Routemaster.of(context).push('/hostel');
                      },
                    ),
                    ServiceDisplayCard(
                      icon: Icons.apartment_rounded,
                      title: 'Rent',
                      onTap: () {
                        Routemaster.of(context).push('/hostel');
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: [
                      Text(
                        'explore',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                      ),
                      Text(
                        ' nearby',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
                const ItemCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
