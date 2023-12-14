import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
alertDialog(String msg, Color toastcolor, Color textcolor){
Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 3,
        backgroundColor: toastcolor,
        textColor:  textcolor,
        fontSize: 16.0
    );
}
