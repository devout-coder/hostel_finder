import 'package:flutter/material.dart';
import 'package:hostelp/mytheme.dart';

class MemberTile extends StatelessWidget {
  const MemberTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 130,
        child: Card(
          surfaceTintColor: lightColorScheme.background,
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Member 1",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: lightColorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Darshan Tailor",
                      style: Theme.of(context).textTheme.labelMedium!,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    IconButton(
                        iconSize: 25,
                        onPressed: () {},
                        color: lightColorScheme.primary,
                        icon: const Icon(Icons.edit_note)),
                    IconButton(
                        iconSize: 25,
                        color: lightColorScheme.primary,
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline_sharp))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "(Male)",
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
