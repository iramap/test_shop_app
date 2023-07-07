import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_shop_app/manage/static_method.dart';
import 'package:velocity_x/velocity_x.dart';

import '../custom_widgets/theme_appbar.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/styles.dart';

class ProductDetails extends StatefulWidget {
  final productData;

  const ProductDetails({Key? key, required this.productData}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var productInfo;

  getSessionData() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   sUserid = sp.getString('user_id');
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        setState(() {
          productInfo = widget.productData;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSessionData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        flexibleSpace: barGredient(),
      ),
      body: productInfo == null?CircularProgressIndicator() :SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: Dim().d12,
                    ),
                    STM().imageView('${productInfo['image']}',fit: BoxFit.fill,height: Dim().d200,width:Dim().d200),

                    SizedBox(
                      height: Dim().d8,
                    ),

                    SizedBox(
                      height: Dim().d8,
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(
              height: Dim().d20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${productInfo['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Sty().mediumText.copyWith(
                          color: Clr().black,
                          fontWeight: FontWeight.w500,
                          fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '\$${productInfo['price']}',
                    // '₹ 198',
                    style: Sty().mediumText.copyWith(
                        color: Clr().red,
                        fontWeight: FontWeight.w500,
                        fontSize: 19),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VxRating(
                        onRatingUpdate: (value) {
                        },
                        isSelectable: false,
                        value: (productInfo['rating']['rate']).toDouble(),
                        normalColor: Colors.grey,
                        selectionColor: Color(0xffffa534),
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      Text(
                        'Reviews : ${productInfo['rating']['count']}',
                        // '₹ 198',
                        style: Sty().mediumText.copyWith(
                            color: Clr().grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dim().d16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d20),
              child: Column(
                children: [
                  Divider(
                    height: 2,
                    thickness: 1.5,
                  ),
                  SizedBox(
                    height: Dim().d12,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Details:',
                      style: Sty().mediumText.copyWith(
                          color: Clr().black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: Dim().d8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dim().d12),
                      child: Text(
                          '${productInfo['description']}',
                        style: Sty().mediumText.copyWith(
                            color: Clr().grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.cart_fill,size: 22),
                            SizedBox(width: 8,),
                            Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0575E6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),

                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
