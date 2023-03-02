import 'package:flutter/material.dart';
import 'package:hostelp/features/profile/widgets/custom_card.dart';
import 'package:hostelp/features/profile/widgets/custom_gender.dart';
import 'package:hostelp/features/profile/widgets/custom_textfield.dart';
import 'package:routemaster/routemaster.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _MyProfileState();
}

class _MyProfileState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

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
          icon:const Icon(
            Icons.arrow_back,
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications_none_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage("assets/images/profile_icon.png"),
                  radius: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCard(
                      img: Image.asset(
                        "assets/images/booking_icon.png",
                        height: 35,
                        width: 50,
                      ),
                      name: "Booking",
                      onTap: () {
                        // Routemaster.of(context).push('/hostel');
                      },
                    ),
                    MyCard(
                      img: Image.asset(
                        "assets/images/wishlist_icon.png",
                        height: 35,
                        width: 50,
                      ),
                      name: "Wishlist",
                      onTap: () {
                        // Routemaster.of(context).push('/hostel');
                      },
                    ),
                    MyCard(
                      img: Image.asset(
                        "assets/images/reward_icon.png",
                        height: 40,
                        width: 50,
                      ),
                      name: "Rewards",
                      onTap: () {
                        // Routemaster.of(context).push('/hostel');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Name',
                  icon: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(240, 240, 240, 1),
                            borderRadius: BorderRadius.circular(12),
                            // image: const DecorationImage(
                            //   image:
                            //       AssetImage('assets/images/gender_icon.png'),
                            // ),
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/gender_icon.png'),
                            height: 15,
                            // width: 10,
                          ),
                        ),
                      ),
                      const GenderSelection(),
                    ],
                  ),
                ),
                CustomTextField(
                  hintText: 'Mobile No',
                  icon: Icon(
                    Icons.phone,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                CustomTextField(
                  hintText: 'Email',
                  icon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                CustomTextField(
                  hintText: 'Address Line 1',
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                CustomTextField(
                  hintText: 'Address Line 2',
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child:const Text(
                    'Update',
                    // style: Theme.of(context).textTheme.bodyMedium,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
