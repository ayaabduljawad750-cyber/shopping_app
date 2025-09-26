import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  final List offers = [
    {
    "title": "50% Off Bags",
    "imgURL":"https://i.insider.com/66eb20b4d17aa3c7b2b3d84f?width=700",
    "description":"Limited time offer on Bags",
    "button":"50% OFF"
    },
    {
      "title":"Free Shipping Weekend",
      "imgURL":"https://niyoindiastore.com/cdn/shop/files/unique-animal-design-lunch-bags-four-color-animal-patterns.jpg?v=1747848153",
      "description":"No delivery charges on orders above \$50",
      "button":"FREE SHIP"
    },
    {
      "title":"Buy 2 Get 1 Free",
      "imgURL":"https://www.karmaplace.com/cdn/shop/articles/A_Complete_Guide_To_Different_Types_of_Bags_and_Their_Features_Banner.png?v=1723887728&width=900",
      "description":"Plus complete bag accessories",
      "button":"B2G1"
    },
    {
      "title":"Student Discount",
      "imgURL":"https://static.vecteezy.com/system/resources/thumbnails/006/102/224/small_2x/back-to-school-white-vintage-sign-with-color-school-bag-isolated-on-white-background-backpack-free-vector.jpg",
      "description":"Extra 20% off with valid student ID",
      "button":"20% OFF"
    },
    {
      "title":"Buy 3 Get 3 Free",
      "imgURL":"https://cdn.thewirecutter.com/wp-content/uploads/2020/03/totebags-lowres-3945.jpg?auto=webp&quality=75&crop=3:2&width=1024",
      "description":"Plus complete bag accessories",
      "button":"B3G3"
    },
  ];
  final List products = [
    {
      "title": "Black Bag",
      "price": 45.9,
      "imgURL": "https://i.ebayimg.com/images/g/CTQAAOSwwrBnUhlK/s-l400.jpg",
    },
    {
      "title": "Fun Bag",
      "price": 50.9,
      "imgURL":
          "https://www.dhresource.com/webp/m/0x0/f2/albu/g7/M01/8A/F3/rBVaSVvNee-AKkNPAAH2hwddi7E006.jpg",
    },
    {
      "title": "Travel Bag",
      "price": 30.9,
      "imgURL":
          "https://pixc.com/wp-content/uploads/2017/09/Image-5_context.jpg",
    },
    {
      "title": "HandBag",
      "price": 25.9,
      "imgURL":
          "https://images.unsplash.com/photo-1705909237050-7a7625b47fac?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D",
    },
    {
      "title": "Nice Bag",
      "price": 60.9,
      "imgURL":
          "https://t4.ftcdn.net/jpg/02/02/39/07/360_F_202390749_8T273Qalaj7HwjvW6W4VSiUsNb753vd2.jpg",
    },
    {
      "title": "Strong Bag",
      "price": 55.9,
      "imgURL":
          "https://buffalojackson.com/cdn/shop/products/Roosevelt_Buffalo_Leather_Satchel_Messenger_Bag_Dark_Oak_1-copy_900x900_crop_center.jpg?v=1623335044",
    },
    {
      "title": "GUESS",
      "price": 99.9,
      "imgURL":
          "https://img.guess.com/image/upload/f_auto,q_auto,dpr_1.5,w_500,c_limit/v1/NA/Asset/North%20America/E-Commerce/GUESS%20Factory/Bug%20Number/6766/GF_Site_YC_ContentCenter_Handbags_6766_03",
    },
    {
      "title": "Safari",
      "price": 35.9,
      "imgURL":
          "https://safaribags.com/cdn/shop/files/Trio-15_BP_N_Teal_02_1024x.jpg?v=1707670998",
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr("Products"),
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
                actions: [
          InkWell(
            onTap: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(const Locale("ar"));
              } else {
                context.setLocale(const Locale("en"));
              }
            },
            child: Row(
              children: [
                const Icon(Icons.language, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                  tr("lang"),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
        
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(tr("FeaturedProducts"), style: TextStyle(fontSize: 30)),
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView(
                        controller: controller,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        children: <Widget>[
                          Center(
                            child: Stack(
                              children: [
                                Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(16),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    "https://i.ebayimg.com/images/g/zKUAAOSwxwhhLu55/s-l1200.jpg",
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    tr("LimitedEditionBag"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(16),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    "https://img.kwcdn.com/product/open/68231e1ee7dd456691aec86b964e62ee-goods.jpeg",
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    tr("LuxuryBag"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(16),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    "https://ham-lerche.dk/cdn/shop/files/27.9knita5_c9e4d481-5c94-4542-bd9c-c9f4cb09c065.png?v=1688462540",
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    tr("ElegantBag"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Colors.teal,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                tr("ShopOurCollection"),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: CreateCard(
                  products[index]["title"],
                  products[index]["imgURL"],
                  products[index]["price"],
                ),
              );
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tr("HotOffers🔥"), style: TextStyle(fontSize: 30)),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: offers.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Createoffer(offers[index]["title"], offers[index]["imgURL"], offers[index]["description"],offers[index]["button"]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget CreateCard(String title, String imgURL, double price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  imgURL,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("Price: $price \$", style: TextStyle()),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.shopping_cart, color: Colors.teal),
                      onPressed: () {
                        SnackBar snackBar = SnackBar(
                          content: Center(
                            child: Text(
                              "Item added to the cart",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget Createoffer(String title, String imgURL, String description, String contentButton) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.network(
              imgURL,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {},
                    child: Text(
                      contentButton,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
