import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/shared/drawer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Page'),
            backgroundColor: Colors.grey.shade800, // Neutro
          ),
          drawer: const CustomDrawer(), // Usando o CustomDrawer
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    CircularPercentIndicator(
                      radius: 130.0,
                      lineWidth: 5.0,
                      percent: 1.0,
                      center: const Text("100%"),
                      progressColor: Colors.green,
                    ),
                    CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: 0.4,
                      center: const Text(
                        "40 hours",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Color.fromARGB(255, 163, 40, 9),
                      progressColor: Color.fromARGB(255, 28, 124, 44),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.9,
                        center: Text("90.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade500, // Neutro
                      child: Center(
                        child: Text(
                          'Page 1',
                          style: TextStyle(
                            color: Colors.grey.shade700, // Neutro
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.grey.shade800, // Neutro
            activeColor: Colors.grey.shade300,
            style: TabStyle.textIn,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: FontAwesomeIcons.searchengin, title: 'Discovery'),
              TabItem(icon: FontAwesomeIcons.arrowDownShortWide, title: 'Add'),
              TabItem(icon: FontAwesomeIcons.deviantart, title: 'Message'),
            ],
            onTap: (index) => tabController.index = index,
            controller: tabController,
          )),
    );
  }
}
