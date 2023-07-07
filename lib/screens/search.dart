import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_shop_app/screens/product_details.dart';

import '../bottom_navigation/bottom_navigation.dart';
import '../manage/static_method.dart';
import '../values/colors.dart';
import '../values/strings.dart';
import '../values/styles.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late BuildContext ctx;
  List<dynamic> productList = [];
  List<dynamic> addToCart = [];
  bool isLoading = true;
  final TextEditingController _searchCtrl = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      // getCategory();
      getSessionData();
    });
    super.initState();
  }

      getSessionData() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   sUserid = sp.getString('user_id');
    //   sMobile = sp.getString('mobile');
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ctx = context;
   return WillPopScope(
     onWillPop: () async{
       STM().back2Previous(ctx);
       return false;
     },
     child: Scaffold(
            bottomNavigationBar: bottomBarLayout(ctx, 0,),
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                STM().back2Previous(ctx);

              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Clr().white,size: 20,
              ),
            ),
            title: Text(
              'Search',
              style: TextStyle(color: Clr().white, fontSize: 20),
            ),
            centerTitle: true,
            backgroundColor: Clr().primaryColor,
          ),
          body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: TextFormField(
                    controller: _searchCtrl,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (value) {
                      // value == null;
                      getCategory(abc: value);
                      _searchCtrl.clear();
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(80)),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      contentPadding: EdgeInsets.all(17),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.search_rounded),
                      ),
                      hintText: "Search your Product",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: BorderSide(
                            color: Clr().primaryColor,
                          )),
                      // border: OutlineInputBorder(
                      //     borderSide: BorderSide(
                      //       color: Clr().transparent,
                      //     )),
                    ),
                  ),
                ),
              ),
              Expanded(
                child:productList.length == 0?  Center(child: Text('No Result Found',style: Sty().mediumText,),) : GridView.builder(
                    padding: EdgeInsets.all(25),
                physics:  BouncingScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8 ,crossAxisSpacing: 15,mainAxisExtent: 260), itemBuilder: (context, index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                     STM().redirect2page(ctx, ProductDetails(productData: null,));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.2,
                                        color: Clr().primaryColor,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '${productList[index]['image_path']}',
                                                    height: 120,
                                                    width: 150,
                                                  )),
                                            ),
                                            Text(
                                             '${productList[index]['name']}',
                                              style: TextStyle(
                                                  color: Clr().black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$ ${productList[index]['sale_price']}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 14),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    '₹ ${productList[index]['price']}',
                                                    style: TextStyle(
                                                        color: Color(0xff666666),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration.lineThrough),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              '${(((int.parse(productList[index]['price'].toString()) - int.parse(productList[index]['sale_price'].toString()))/int.parse(productList[index]['price'].toString())) * 100).round()}% off',
                                              style: TextStyle(
                                                  color: Clr().red,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              onPressed: () {

                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 4, top: 5, left: 4, right: 5),
                                                child: Wrap(
                                                  children: [
                                                    SvgPicture.asset('assets/cartb.svg',height: 15,width: 15,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      ' Cart',
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color(0xffEBBC4E))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                   );
                  }
                ),
              ),
            ],
          )
        ),
   );

  }
  void getCategory({abc}) async {
    FormData body = FormData.fromMap({'search': abc});
    var result = await STM().post(ctx, Str().loading, 'serch_product', body);
    setState(() {
      productList = result['search_query'];
    });
  }
}
