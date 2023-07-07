import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_shop_app/bottom_navigation/bottom_navigation.dart';

import '../manage/static_method.dart';
import '../values/colors.dart';
import 'login_screen.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();

}
class _MyProfileState extends State<MyProfile> {
  late BuildContext ctx;

  bool isLoggedIn = false;
  checkLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.getBool("isLoggedIn") != null){
      setState(() {
        isLoggedIn = true;
      });
      print("Looks logged in...");
    }else{
      isLoggedIn = false;
      print("looks not logged in...");
      STM().redirect2page(context, LoginScreen());
    }
  }
  void initState()  {
    checkLoggedIn();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarLayout(context, 1,),
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: isLoggedIn ? SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 16,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(16, 2, 16, 16),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    // controller: profileName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),

                          borderSide: BorderSide(color: Colors.grey,)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Clr().red, width: 1),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      contentPadding: EdgeInsets.only(left: 20,right: 10),
                      hintText: "Name",
                      // filled: true,
                      // fillColor: Colors.grey[100],
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: SvgPicture.asset('assets/img/profileicon.svg',height: 15,width: 15,),
                      ),
                      // prefixIcon: SvgPicture.asset('assets/img/profileicon.svg',height: 5,width: 5,)
                      // prefixIconColor: Color(0xff00182E)
                    ),
                  )
                ],
              )),
          Container(
              margin:EdgeInsets.fromLTRB(16, 2, 16, 16),
              child: Column(
                children: [
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // controller: profileEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),

                            borderSide: BorderSide(color: Colors.grey,)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Clr().red, width: 1),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: "Email",
                        // filled: true,
                        // fillColor: Colors.grey[100],
                        prefix: Padding(
                          padding: EdgeInsets.only(right: 8,top: 4),
                          child: SvgPicture.asset('assets/img/emailicon.svg',height: 15,width: 15,),
                        ),)

                  )
                ],
              )),
          Container(
              margin: EdgeInsets.fromLTRB(16, 2, 16, 16),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        // enabled: false,
                        // controller: profileNumber,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),

                              borderSide: BorderSide(color: Colors.grey,)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Clr().red, width: 1),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Mobile Number",
                          prefix: Padding(
                            padding: EdgeInsets.only(right: 8,top: 4),
                            child: SvgPicture.asset('assets/img/phoneicon.svg',height: 15,width: 15,),
                          ),
                          suffix:InkWell(
                            onTap: (){
                              // changeMobilePopUp();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 8,right: 20),
                              child: SvgPicture.asset('assets/img/editicon.svg',height: 15,width: 15,),
                            ),
                          ),

                        ),
                      ),
                    ),
                    // Container(
                    //   color: Colors.grey[100],
                    //   child: IconButton(
                    //       onPressed: () {
                    //         changeMobilePopUp();
                    //       },
                    //       color: primary(),
                    //       icon: Icon(
                    //         Icons.edit_outlined,
                    //         color: primary(),
                    //       )),
                    // ),
                  ])
                ],
              )),
          // Container(
          // margin: EdgeInsets.fromLTRB(25, 2, 25, 25),
          // child: Column(
          //   children: [

          //     TextFormField(
          //       keyboardType: TextInputType.visiblePassword,
          //       controller: profilePassword,
          //       decoration: InputDecoration(
          //           border: InputBorder.none,
          //           hintText: "Password",
          //           filled: true,
          //           fillColor: Colors.grey[100],
          //           suffixIcon: Icon(Icons.edit_outlined, color: primary(),),
          //           prefixIcon: Icon(Icons.lock_outlined, color: primary(),),
          //           prefixIconColor: primary()),
          //     )
          //   ],
          // )),
          SizedBox(
            height:12,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment(0.0, 0.4),
                  begin: Alignment(0.0, -1),
                  colors: [Color(0xFF065197), Color(0xFF337ec4)],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                  //make color or elevated button transparent
                ),
                // onPressed: () async {
                //   SharedPreferences sp = await SharedPreferences.getInstance();
                //   // if(profileName.text.toString() == sp.getString("name").toString() || profileEmail.text.toString() == sp.getString("email").toString())
                //   if(isLength(profileName.text.toString(), 3)){
                //     if(isEmail(profileEmail.text)){
                //       saveNameAndEmail();
                //     }
                //     else{
                //       showDialog(context: context, builder: (ctx){
                //         return AlertDialog(content: Text("Enter a valid email"),);
                //       });
                //     }
                //   }
                //   else{
                //     showDialog(context: context, builder: (ctx){
                //       return AlertDialog(content: Text("Enter a valid name"),);
                //     });
                //   }
                //
                // },
                onPressed: (){},
                child: Center(
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )),

          SizedBox(
            height: 8,
          ),
        ]),
      ) : Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(child: Column(
          children: [
            Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_of0hrrki.json'),
            Text("Please login to view your profile"),
            TextButton(onPressed: (){
              STM().redirect2page(context, LoginScreen());
            }, child: Text("Login"))
          ],
        ),),
      ),
    );

  }
}
