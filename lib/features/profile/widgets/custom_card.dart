import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final Image img;
  final String name;
  final void Function() onTap;
  const MyCard(
      {super.key, required this.img, required this.name, required this.onTap});

  @override
  State<MyCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.all(Radius.circular(15)),
            color: Theme.of(context).colorScheme.background,
          ),
          padding: const EdgeInsets.all(8.0),
          width: 95,
          height: 85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.img,
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
