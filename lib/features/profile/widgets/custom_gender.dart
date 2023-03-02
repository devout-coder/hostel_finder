import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int _genderValue = 0;

  final List<String> _gender = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        _gender.length,
        (int index) {
          var color2 = Theme.of(context).colorScheme.primary;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: RawChip(
              selectedShadowColor: Colors.white,
              showCheckmark: false,
              side: BorderSide(
                width: 1,
                color: _genderValue == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black12,
              ),
              // iconTheme: const IconThemeData.fallback(),
              label: Text(
                _gender[index],
                style: TextStyle(
                  color: _genderValue == index ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
              backgroundColor: _genderValue == index
                  ? color2
                  : const Color.fromRGBO(240, 240, 240, 1),
              selectedColor: Theme.of(context).colorScheme.primary,
              onSelected: (bool selected) {
                setState(() {
                  _genderValue = (selected ? index : null)!;
                });
              },
              selected: _genderValue == index,
            ),
          );
        },
      ).toList(),
    );
  }
}
