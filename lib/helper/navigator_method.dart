import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

routeTo(BuildContext context, route) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ));
}

routeCuperTo(BuildContext context, Widget? route) {
  if (route != null) {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => route,
        ));
  }
}

popBack(BuildContext context) {
  Navigator.pop(context);
}

removeAndRouteTo(BuildContext context, route) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
}
