import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RHConfirmationComponent extends StatefulWidget {
  @override
  _RHConfirmationComponentState createState() => _RHConfirmationComponentState();
}

class _RHConfirmationComponentState extends State<RHConfirmationComponent> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var phoneController = TextEditingController();
  var postController = TextEditingController();
  var roomDescriptionController = TextEditingController();
  FocusNode phoneNode = FocusNode();
  FocusNode postNode = FocusNode();
  FocusNode descriptionNode = FocusNode();
  FocusNode descriptionController = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Phone number", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: phoneController,
              textFieldType: TextFieldType.PHONE,
              focus: phoneNode,
              nextFocus: postNode,
              autoFocus: false,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your phone number",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          16.height,
          Text("Title of the post", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: postController,
              textFieldType: TextFieldType.PHONE,
              focus: postNode,
              nextFocus: descriptionNode,
              autoFocus: false,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your phone number",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          16.height,
          Text("Room Description", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: roomDescriptionController,
              textFieldType: TextFieldType.PHONE,
              focus: descriptionNode,
              autoFocus: false,
              maxLines: 5,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your descriptive content",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
