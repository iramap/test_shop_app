// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:test_shop_app/screens/my_home.dart';
//
// import '../bottom_navigation/bottom_navigation.dart';
// import '../manage/static_method.dart';
// import '../values/colors.dart';
// import '../values/dimens.dart';
// import '../values/styles.dart';
// import 'my_cart.dart';
//
//
// class searchpage extends StatefulWidget {
//   @override
//   State<searchpage> createState() => searchpageState();
// }
//
// class searchpageState extends State<searchpage> {
//   late BuildContext ctx;
//
//
//
//   // List<dynamic> resultList = [];
//   // List<dynamic> orderbooksList = [];
//   List<dynamic> categoryList = [];
//   List<dynamic> searchList = [];
//   List<dynamic> subcatList = [];
//
//   String? sUserid;
//
//
//
//   int? tappedIndex;
//
//   getSession() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     setState(() {
//       sUserid = sp.getString('userid') ?? "";
//     });
//     STM().checkInternet(ctx, widget).then((value) {
//       if (value) {
//         getOrderbooks();
//       }
//     });
//   }
//
//   @override
//   void initState() {
//
//
//     Future.delayed(Duration.zero, () {
//       setState(() {
//         getSession();
//       });
//     });
//     tappedIndex = -1;
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ctx = context;
//     return WillPopScope(
//       onWillPop: () async {
//         STM().finishAffinity(ctx, MyHome());
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Clr().white,
//         bottomNavigationBar: bottomBarLayout(ctx, 0,b: true),
//         appBar:AppBar(
//           leading: InkWell(
//             onTap: () {
//               STM().back2Previous(ctx);
//
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new,
//               color: Clr().white,size: 20,
//             ),
//           ),
//           title: Text(
//             'Search',
//             style: TextStyle(color: Clr().white, fontSize: 20),
//           ),
//           centerTitle: true,
//           backgroundColor: Clr().primaryColor,
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   child: TextFormField(
//                     // onChanged: searchBook,
//                     onChanged: (value) {
//                       searchterm(value);
//                     },
//                     decoration: Sty().TextFormFieldOutlineStyle.copyWith(
//                       fillColor: Color(0xffFFFFFF),
//                       filled: true,
//                       contentPadding: EdgeInsets.all(0),
//                       prefixIcon: Align(
//                         widthFactor: 1.0,
//                         heightFactor: 1.0,
//                         child: SvgPicture.asset('assets/search.svg',
//                             width: 22, height: 22),
//                       ),
//                       hintText: "Search",
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide(
//                             color: Clr().transparent,
//                           )),
//                       // border: OutlineInputBorder(
//                       //     borderSide: BorderSide(
//                       //       color: Clr().transparent,
//                       //     )),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: Dim().d4,
//                       ),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: Dim().d16),
//                           child: Text('Category',
//                               style: Sty().extraLargeText.copyWith(
//                                   fontSize: 18,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: Dim().d16,
//                       ),
//                       SizedBox(
//                         height: 55,
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: BouncingScrollPhysics(),
//                           padding: EdgeInsets.only(
//                             left: Dim().d16,
//                             right: Dim().d16,
//                           ),
//                           scrollDirection: Axis.horizontal,
//                           itemCount: categoryList.length,
//                           itemBuilder: (context, index) {
//                             return categoryList[index]['books'].isEmpty
//                                 ? Container()
//                                 : Padding(
//                               padding: EdgeInsets.only(
//                                 right: Dim().d8,
//                                 left: Dim().d8,
//                               ),
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedIndex = index;
//                                     // _destinationIndex = categoryList[index].Jumpto(categoryList);
//                                     // // _destinationIndex = categoryList[index]._random.nextInt(3);
//                                     searchList =
//                                         categoryList.where((element) {
//                                           final resulttile = element['name']
//                                               .toString()
//                                               .toLowerCase();
//                                           final input = categoryList[index]
//                                           ['name']
//                                               .toString()
//                                               .toLowerCase();
//                                           return resulttile.contains(input);
//                                         }).toList();
//                                   });
//                                   // _scrollToIndex(_destinationIndex);
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                     color: tappedIndex == index
//                                         ? Color(0xffecf8f5)
//                                         : Color(0xfff9eef1),
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(Dim().d8),
//                                     ),
//                                     border: Border.all(
//                                         color: Clr().lightGrey),
//                                   ),
//                                   child: Center(
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: Dim().d8),
//                                         child: Text(
//                                           '${categoryList[index]['name'].toString()}',
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                             color: tappedIndex == index
//                                                 ? Color(0xff219653)
//                                                 : Color(0xffF26B6C),
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: Dim().d16,
//                       ),
//                       ListView.builder(
//                           physics: BouncingScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: searchList.length,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: Dim().d4,
//                                 ),
//                                 searchList[index]['books'].isEmpty
//                                     ? Container()
//                                     : Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: Dim().d16),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                           '${searchList[index]['name'].toString()}',
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: Sty()
//                                               .extraLargeText
//                                               .copyWith(
//                                               fontSize: 18,
//                                               color: Colors.black,
//                                               fontWeight:
//                                               FontWeight.w400)),
//                                       InkWell(
//                                         onTap: () {
//                                           // STM().redirect2page(ctx, ());
//                                         },
//                                         child: Text(
//                                           '',
//                                           style: Sty()
//                                               .mediumText
//                                               .copyWith(
//                                               color:
//                                               Color(0xff991404),
//                                               fontSize: 12,
//                                               fontWeight:
//                                               FontWeight.w500),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 searchList[index]['books'].isEmpty
//                                     ? Container()
//                                     : SizedBox(
//                                   height: 235,
//                                   child: ListView.builder(
//                                     shrinkWrap: true,
//                                     physics: BouncingScrollPhysics(),
//                                     scrollDirection: Axis.horizontal,
//
//                                     // itemCount: resultList.length,
//                                     itemCount:
//                                     searchList[index]['books'].length,
//                                     itemBuilder: (context, index2) {
//                                       return Padding(
//                                         padding: EdgeInsets.only(
//                                             right: Dim().d2,
//                                             top: Dim().d16,
//                                             bottom: Dim().d8,
//                                             left: Dim().d16),
//                                         child: productLayout(ctx, index2,
//                                             searchList[index]['books']),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             );
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget productLayout(ctx, index2, list) {
//     return InkWell(
//       onTap: () {
//         STM().redirect2page(
//             ctx,
//             BookName(
//               data: list[index2],sKey: 'id',
//             ));
//       },
//       child: SizedBox(
//         width: 120,
//         child: Card(
//           elevation: 2,
//           child: Column(
//             children: [
//               Center(
//                 child: Image.network(
//                   '${list[index2]['cover_image'].toString()}',
//
//                   // 'assets/book5.png',
//                   fit: BoxFit.fill,
//                   height: 150,
//                   width: 130,
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 12, right: 12),
//                     child: Text(
//                       '${list[index2]['name'].toString()}',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       // 'Arham Jaap',
//                       style: TextStyle(
//                           color: Clr().black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 12, right: 12),
//                     child: Text(
//                       '${list[index2]['author'].toString()}',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       // 'Jen Petro-Roy',
//                       style: TextStyle(
//                         color: Color(0xff666666),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void getOrderbooks() async {
//     var result = await STM().get(ctx, Str().loading, 'get_order_books');
//     setState(() {
//       categoryList = result['book_categories'];
//       searchList = categoryList;
//       // orderbooksList = result['order_books'];
//     });
//   }
//
//   void searchterm(String value) {
//     if (value.isEmpty) {
//       setState(() {
//         searchList = categoryList;
//       });
//     } else {
//       setState(() {
//         searchList = categoryList.where((element) {
//           subcatList = element['books'].where((e) {
//             final subtitle = e['name'].toString().toLowerCase();
//             final ii = value.toLowerCase();
//             return subtitle.contains(ii);
//           }).toList();
//           return subcatList.isNotEmpty;
//         }).toList();
//       });
//     }
//   }
// }
