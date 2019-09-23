import 'package:flutter/material.dart';
import 'package:flutter_app/demo/alert_dialog_demo.dart';
import 'package:flutter_app/demo/bottom_sheet_demo.dart';
import 'package:flutter_app/demo/card_demo.dart';
import 'package:flutter_app/demo/chip_demo.dart';
import 'package:flutter_app/demo/data_table_demo.dart';
import 'package:flutter_app/demo/datetime_demo.dart';
import 'package:flutter_app/demo/expansion_panel_demo.dart';
import 'package:flutter_app/demo/popup_menu_button_demo.dart';
import 'package:flutter_app/demo/radio_demo.dart';
import 'package:flutter_app/demo/simple_dialog_demo.dart';
import 'package:flutter_app/demo/snack_bar_demo.dart';
import 'package:flutter_app/demo/stepper_demo.dart';

import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'floating_action_button_demo.dart';
import 'form_demo.dart';
import 'slider_demo.dart';
import 'switch_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponts'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'Stepper',
            page: StepperDemo(),
          ),
          ListItem(
            title: 'DataTable',
            page: DataTableDemo(),
          ),
          ListItem(
            title: 'Card',
            page: CardDemo(),
          ),
          ListItem(
            title: 'Chip',
            page: ChipDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'Checkbox',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTime',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialog',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'BottomSheet',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBar',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpansionPanel',
            page: ExpansionPanelDemo(),
          ),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({Key key, this.title, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
