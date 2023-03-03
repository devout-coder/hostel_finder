import 'package:flutter/material.dart';

import 'package:hostelp/mytheme.dart';

class TotalPriceTile extends StatelessWidget {
  const TotalPriceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: lightColorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 180,
              ),
              Text(
                "Rs. 10000",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
