import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  final String noDataText;

  NoDataView({this.noDataText = 'No Data'});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(noDataText, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
