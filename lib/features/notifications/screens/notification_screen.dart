import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:hostelp/features/notifications/widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text("Back"),
        leading: IconButton(
          onPressed: () {
            Routemaster.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: IconButton(
              onPressed: () {
                Routemaster.of(context).push('/profile');
              },
              icon: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
            ],
          ),
        ),
      ),
    );
  }
}
