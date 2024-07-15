import 'package:flutter/material.dart';
import 'package:eccomerce/widgets/HomeAppBar.dart';
import 'package:eccomerce/widgets/CategoriesWidget.dart';
import 'package:eccomerce/widgets/ItemsWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eccomerce/pages/CartPage.dart';
import 'package:eccomerce/pages/ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page= 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            page= index;
          });
        },
        children: [
          // Home Page Content
          ListView(
            children: [
              HomeAppBar(),
              Container(
                // height: 500,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 62, 65),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 203, 203),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          //kategori
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Cari disini...",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //kategori
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Text(
                        "Kategori",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    //kategori
                    CategoriesWidget(),

                    //items
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Penjualan Terbaik",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //items widget
                    Itemswidget(),
                  ],
                ),
              ),
            ],
          ),

          // Cart Page Content
          CartPage(),

          // User Profile Page Content
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Color.fromARGB(255, 62, 62, 65),
        onTap: (index) {
          setState(() {
            page= index;
          });
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
        height: 70,
        color: Color.fromARGB(255, 0, 0, 0),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
