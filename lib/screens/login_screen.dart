import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_shop_app/custom_widgets/custom_widgets.dart';
import 'package:test_shop_app/values/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../manage/static_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String aniUrl = 'https://assets4.lottiefiles.com/packages/lf20_nc1bp7st.json';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // To remove bottom overflow error while typing in text form field.
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),

              aniUrl== null ?SizedBox(
                  height: 400,
                  child: STM().loadingPlaceHolder()): Lottie.network(aniUrl,),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomWidgets().customTextField(
                      title: "Email : ",
                      hint: "Enter Email",
                    ),
                    20.heightBox,
                    CustomWidgets().customTextField(
                      title: "Password : ",
                      hint: "Enter Password",
                      isPassTextField: true,
                    ),
                    20.heightBox,
                    ElevatedButton(onPressed: () {

                    }, child: "Login".text.semiBold.xl2.make()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
