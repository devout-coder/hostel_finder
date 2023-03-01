import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DelayedDisplay(
          slidingBeginOffset: const Offset(-0.4, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              // color: Colors.grey.shade300,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 195, 195, 195),
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notif title",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                      "lorem fefninf vrifrjgio dkwwodkeof grgorgorgk vrorkfogkrog frefrfrnfnrjgnrj grkgrog frjirogjrogj grfrfr frfrfqqw jirjgr vfvr......"),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
