import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_shop_app/bottom_navigation/bottom_navigation.dart';
import 'package:test_shop_app/screens/my_cart.dart';
import 'package:test_shop_app/screens/my_profile.dart';
import 'package:test_shop_app/screens/product_details.dart';
import 'package:test_shop_app/screens/search.dart';
import 'package:test_shop_app/values/colors.dart';
import 'package:test_shop_app/values/styles.dart';
import 'package:velocity_x/velocity_x.dart';
import '../custom_widgets/theme_appbar.dart';
import '../manage/static_method.dart';
import '../values/strings.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<dynamic> productList = [];
  List<dynamic> cartItems = [];

  getSessionData() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   sUserid = sp.getString('user_id');
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        getProductsFromApi();
      }
    });
  }

  @override
  void initState() {
    getSessionData();
    super.initState();
  }

  void addToCart(dynamic product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void removeFromCart(dynamic product) {
    setState(() {
      cartItems.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarLayout(
        context,
        0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          STM().redirect2page(context, MyCart(cartItems: cartItems));
        },
      ),
      appBar: AppBar(
        title: Image.asset('assets/images/appImg.png', height: 40, width: 40),
        centerTitle: true,
        leadingWidth: 80,
        leading: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'EShop',
                  style: Sty().mediumText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Clr().white,
                      fontSize: 18),
                ))),
        flexibleSpace: barGredient(),
        actions: [
          InkWell(
            onTap: () {
              STM().redirect2page(context, Search());
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.short_text_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            mainAxisExtent: 300),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return myCustomCard(
              titleText: "${productList[index]["title"]}",
              imgUrl: "${productList[index]["image"]}",
              price: "${productList[index]["price"]}",
              onAddToCartPressed: () {
                addToCart(productList[index]);
              }).onTap(() {
            STM().redirect2page(
                context, ProductDetails(productData: productList[index]));
          });
        },
      ),
    );
  }

  // Custom Card Container style
  Widget myCustomCard(
      {required String titleText,
      required String imgUrl,
      required String price,
      onAddToCartPressed}) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imgUrl,
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
            10.heightBox,
            titleText.text
                .maxLines(2)
                .overflow(TextOverflow.ellipsis)
                .semiBold
                .color(Colors.grey)
                .make()
                .box
                .height(30)
                .width(120)
                .make(),
            10.heightBox,
            "\$$price".text.color(Colors.red).bold.size(16).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0575E6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                onAddToCartPressed;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.cart_fill, size: 20),
                  Str().addToCart.text.white.bold.size(14).make(),
                ],
              ),
            ),
          ],
        )
            .box
            .white
            .margin(const EdgeInsets.symmetric(horizontal: 4))
            .roundedSM
            .padding(const EdgeInsets.all(8))
            .make(),
      ),
    );
  }

  // Api call List / Map data without Model class
  void getProductsFromApi() async {
    var jsonRes = await STM().get(context, Str().loading, 'products');
    setState(() {
      productList = jsonRes;
      print(jsonRes);
      //debugPrint(jsonRes.toString());
    });
  }
}
