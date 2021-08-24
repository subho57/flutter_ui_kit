import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/components/home/selectable_item.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSHomeFavAllListComponent extends StatefulWidget {
  static String tag = '/HSHomeFavAllListComponent';

  @override
  HSHomeFavAllListComponentState createState() => HSHomeFavAllListComponentState();
}

class HSHomeFavAllListComponentState extends State<HSHomeFavAllListComponent> {
  List<HSDeviceModel> deviceList = getDeviceList();
  int checkedIndex = 0;
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black),
          onPressed: () {
            finish(context);
          },
        ),
        title: Text(
          "Favorite Accessories",
          style: primaryTextStyle(weight: FontWeight.bold),
        ),
      ),
      body: DragSelectGridView(
        gridController: controller,
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (context, index, selected) {
          return SelectableItem(
            index: index,
            color: Colors.blue,
            selected: selected,
          );
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }

  void scheduleRebuild() => setState(() {});
}
