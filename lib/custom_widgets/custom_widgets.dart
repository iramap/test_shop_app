import 'package:flutter/material.dart';
import 'package:test_shop_app/values/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomWidgets {
  Widget customTextField(
      {String? title, String? hint, controller, bool isPassTextField = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Using velocity_x here
        title!.text.color(Colors.red).semiBold.size(16).make(),
        5.heightBox,
        TextFormField(
          obscureText: isPassTextField,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: Clr().lightGrey,
            filled: true,
            // border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        5.heightBox,
      ],
    );
  }
}
