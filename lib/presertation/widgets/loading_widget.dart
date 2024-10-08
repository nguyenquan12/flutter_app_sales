import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SpinKitPouringHourGlass(
          color: Colors.white,
        ));
  }
}
