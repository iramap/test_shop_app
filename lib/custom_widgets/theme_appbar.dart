import 'package:flutter/material.dart';

import '../values/colors.dart';

Widget barGredient(){

  return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),

          colors: <Color>[ Clr().appbarColor.withOpacity(0.9), Clr().appbarColor1.withOpacity(0.9),]),
      ),);
}