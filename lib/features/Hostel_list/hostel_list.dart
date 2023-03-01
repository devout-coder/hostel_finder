import 'package:flutter/material.dart';
import 'package:hostelp/features/search/utils.dart';
import 'package:routemaster/routemaster.dart';

class HostelList extends StatelessWidget {
  const HostelList({Key? key}) : super(key: key);

  void roomFilterSelectionManager(int index) {
    for (int i = 0; i < Utils.selectedRoomList.length; i++) {
      if (i == index) {
        Utils.selectedRoomList[i]['isFilterSelected'] =
            !Utils.selectedRoomList[i]['isFilterSelected'];
      } else {
        Utils.selectedRoomList[i]['isFilterSelected'] = false;
      }
    }
  }

  void genderFilterSelectionManager(int index) {
    for (int i = 0; i < Utils.selectedGenderList.length; i++) {
      if (i == index) {
        Utils.selectedGenderList[i]['isGenderSelected'] =
            !Utils.selectedGenderList[i]['isGenderSelected'];
      } else {
        Utils.selectedGenderList[i]['isGenderSelected'] = false;
      }
    }
  }

  void messBooleanManager(int index) {
    for (int i = 0; i < Utils.messBooleanList.length; i++) {
      if (i == index) {
        Utils.messBooleanList[i]['isSelected'] =
            !Utils.messBooleanList[i]['isSelected'];
      } else {
        Utils.messBooleanList[i]['isSelected'] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Routemaster.of(context).pop();
            },
          ),
          elevation: 5,
          title: const Text(
            'Hostels in Location',
          ),
          floating: true,
          snap: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24))),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Scaffold(
                              body: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'For',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount:
                                              Utils.selectedGenderList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        genderFilterSelectionManager(
                                                            index);
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Utils.selectedGenderList[
                                                                  index][
                                                              'isGenderSelected']
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .inversePrimary
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .onInverseSurface,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          Utils.selectedGenderList[
                                                                  index]
                                                              ['genderType'],
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Room Type',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount:
                                                Utils.selectedRoomList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                children: [
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          roomFilterSelectionManager(
                                                              index);
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        color: Utils.selectedRoomList[
                                                                    index][
                                                                'isFilterSelected']
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .inversePrimary
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .onInverseSurface,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            Utils.selectedRoomList[
                                                                    index]
                                                                ['roomType'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Price range: Rs. ${Utils.currentSelectedPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Slider(
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        label: 'Select price',
                                        value: Utils.currentSelectedPrice
                                            .toDouble(),
                                        onChanged: (value) {
                                          setState(() {
                                            Utils.currentSelectedPrice =
                                                value.toInt();
                                          });
                                        },
                                        min: 1000,
                                        divisions: 10,
                                        max: 20000,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Preferred for',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ListView.builder(
                                            itemCount: Utils
                                                .selectedWorkPreferenceList
                                                .length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          Utils.selectedWorkPreferenceList[
                                                                      index][
                                                                  'isSelected'] =
                                                              !Utils.selectedWorkPreferenceList[
                                                                      index][
                                                                  'isSelected'];
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        color: Utils.selectedWorkPreferenceList[
                                                                    index]
                                                                ['isSelected']
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .inversePrimary
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .onInverseSurface,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            Utils.selectedWorkPreferenceList[
                                                                    index][
                                                                'workPreferenceType'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Mess',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ListView.builder(
                                            itemCount:
                                                Utils.messBooleanList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          messBooleanManager(
                                                              index);
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        color: Utils.messBooleanList[
                                                                    index]
                                                                ['isSelected']
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .inversePrimary
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .onInverseSurface,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            Utils.messBooleanList[
                                                                index]['label'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      });
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
          const HostelCard(),
        ]))
      ],
    ));
  }
}

class HostelCard extends StatelessWidget {
  const HostelCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.16;
    final width = MediaQuery.of(context).size.width;
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: Card(
            elevation: 5,
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Container(
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("A.G Hostel",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Ratings : 4.1",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  const Icon(
                                    Icons.star_rate,
                                    color: Colors.orangeAccent,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text("30000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                              const Text("  per month"),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "2 km from location",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Available",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
