import 'package:flutter/material.dart';
import 'package:hostelp/features/home/consts.dart';
import 'package:routemaster/routemaster.dart';

class PropertyCard extends StatefulWidget {
  final Property property;
  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  Color ratingColor(double rating) {
    if (rating >= 2 && rating < 4) {
      return Colors.amber;
    } else if (rating > 4) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Routemaster.of(context).push('/details', queryParameters: {
            'name': widget.property.name,
            'photo': widget.property.photo,
            'rating': widget.property.rating.toString(),
            'address': widget.property.address,
          });
        },
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 5,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Image.network(
                        height: 200,
                        width: constraints.maxWidth,
                        fit: BoxFit.fitWidth,
                        widget.property.photo,
                      );
                    }),
                  ),
                  // AspectRatio(
                  //   aspectRatio: 16 / 10,
                  //   child: Container(
                  //     height: height,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       image:  DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: ,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8, left: 10, right: 10, top: 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.property.name.split(" ")[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  " ${widget.property.name.split(" ")[1]}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Chip(
                              avatar: const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              label: Text(
                                widget.property.rating.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              backgroundColor:
                                  ratingColor(widget.property.rating),
                              side: BorderSide(
                                width: 1,
                                color: ratingColor(widget.property.rating),
                              ),
                              elevation: 6.0,
                              shadowColor: Colors.grey[60],
                              padding: const EdgeInsets.all(5),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: const [
                            //     Icon(Icons.wifi),
                            //     Icon(Icons.air_rounded),
                            //     Icon(Icons.local_dining_rounded),
                            //     Icon(Icons.local_dining_rounded),
                            //     Icon(Icons.tv_rounded),
                            //     SizedBox(
                            //       width: 3,
                            //     ),
                            //     Text('3 rooms'),
                            //   ],
                            // ),
                            Text(widget.property.address,
                                style: Theme.of(context).textTheme.labelLarge!
                                // .copyWith(
                                //   color: Colors.white,
                                // ),
                                ),
                            Row(
                              children: const [
                                Text('Know More'),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
