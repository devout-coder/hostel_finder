import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.16;
    // final width = MediaQuery.of(context).size.width;
    return DelayedDisplay(
      slidingBeginOffset: const Offset(0, 0.8),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {},
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
                      child: Image.network(
                        fit: BoxFit.contain,
                        "https://images.unsplash.com/photo-1555854877-bab0e564b8d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                      ),
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
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'A.G',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' HOSTEL',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.wifi),
                                  Icon(Icons.air_rounded),
                                  Icon(Icons.local_dining_rounded),
                                  Icon(Icons.local_dining_rounded),
                                  Icon(Icons.tv_rounded),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('3 rooms'),
                                ],
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
      )),
    );
  }
}
