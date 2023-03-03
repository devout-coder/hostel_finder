import 'package:flutter/material.dart';

import '../widgets/members_tile.dart';
import '../widgets/total_price_tile.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const MemberTile();
              }),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Add Member"),
                    ],
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TotalPriceTile(),
          )
        ],
      )),
    );
  }
}
