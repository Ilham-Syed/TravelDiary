import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

import '../misc/colors.dart';
import '../widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images={
    "balloning.png":"Balloning",
    "hiking.png": "Hiking",
    "kayaking.png" : "Kayaking",
    "snorkling.png" : "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54,),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 10,),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Travel Blogs"),
                  Tab(text: "My Trips"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15,top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(
                                  "img/mountain.jpeg"
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                    );
                  },
                ),
                Text("Travel Blogs"),
                Text("My Trips")
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //Explore More text section
          Container(
            margin: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 22,
                ),
                AppText(text: "See all", colour: AppColors.textColor1),
              ],
            ),
          ),

          const SizedBox(
            height: 7,
          ),

          //Bottom Listview Images
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,itemBuilder: (_,index){
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child:Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(
                                  "img/"+images.keys.elementAt(index)
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: AppText(
                        text: images.values.elementAt(index),
                        colour: AppColors.textColor2,
                      ),
                    )
                  ],
                )

              );
            }),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius; // MADE FINAL

  const CircleTabIndicator(
      {required this.color, required this.radius}); // MADE CONST

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2 - 5);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}