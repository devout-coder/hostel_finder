import 'package:flutter/material.dart';

class ServiceDisplayCard extends StatelessWidget {
  const ServiceDisplayCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.inversePrimary,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Icon(
              icon,
              size: 65,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
