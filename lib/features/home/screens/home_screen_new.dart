import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hostelp/features/home/consts.dart';
import 'package:hostelp/features/home/widgets/property_card.dart';
import 'package:routemaster/routemaster.dart';

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

  int? selectedProperty;

  final List<String> propTitles = ['Hostel', 'PG', 'Rent'];
  List<String> propSmallTitles = ['hostels', 'PGs', 'rent apartments'];
  List<IconData> propIcons = [
    Icons.apartment_rounded,
    Icons.bed_rounded,
    Icons.house_rounded
  ];

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
                // showModalBottomSheet(
                //   context: context,
                //   shape: const RoundedRectangleBorder(
                //       borderRadius:
                //           BorderRadius.vertical(top: Radius.circular(24))),
                //   builder: (context) {
                //     return SingleChildScrollView(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.3,
                //           child: Column(children: [
                //             Text(
                //               'Your location',
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .displaySmall
                //                   ?.copyWith(fontWeight: FontWeight.bold),
                //             ),
                //             const SizedBox(
                //               height: 50,
                //             ),
                //             Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12),
                //                 border: Border.all(
                //                     color:
                //                         Theme.of(context).colorScheme.primary),
                //               ),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Column(
                //                   children: [
                //                     Text(
                //                       mainArea ?? '',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .labelLarge,
                //                     ),
                //                     Text(
                //                       subArea ?? '',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .labelMedium,
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             )
                //           ]),
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 7),
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
              icon: const Icon(Icons.notifications_none),
            ),
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
                  padding: const EdgeInsets.all(8.0),
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
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: List<Widget>.generate(
                    propTitles.length,
                    (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RawChip(
                          selectedShadowColor: Colors.white,
                          showCheckmark: false,
                          side: BorderSide(
                            width: 1,
                            color: selectedProperty == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                          ),
                          // iconTheme: const IconThemeData.fallback(),
                          label: Column(
                            children: [
                              Icon(
                                propIcons[index],
                                size: 65,
                              ),
                              Text(
                                propTitles[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          selectedColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedProperty = (selected ? index : null);
                            });
                          },
                          selected: selectedProperty == index,
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            selectedProperty == null
                                ? "explore"
                                : propSmallTitles[selectedProperty!],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                          ),
                          Text(
                            selectedProperty == null ? ' nearby' : '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                          )
                        ],
                      ),
                      selectedProperty != null
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedProperty = null;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 13,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    "back to explore",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  )
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: allProperties.length,
                      itemBuilder: (ctx, index) {
                        debugPrint(
                            "${allProperties[index].name} ${allProperties[index].type}");
                        // if (selectedProperty == null ||
                        //     allProperties[index].type ==
                        //         propTitles[selectedProperty!]) {
                        return PropertyCard(
                          key: UniqueKey(),
                          property: allProperties[index],
                        );
                        // }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
