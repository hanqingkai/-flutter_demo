import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget floatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary, shape: StadiumBorder())),
          child: RaisedButton(
            elevation: 0.0,
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            //可在控件中设置也可以在Theme设置
            // color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          elevation: 16.0,
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary, shape: StadiumBorder())),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //可在控件中设置也可以在Theme设置
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            // textTheme: ButtonTextTheme.primary,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //可在控件中设置也可以在Theme设置
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            // textTheme: ButtonTextTheme.primary,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //可在控件中设置也可以在Theme设置
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            // textTheme: ButtonTextTheme.primary,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //可在控件中设置也可以在Theme设置
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            // textTheme: ButtonTextTheme.primary,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonBar(
          buttonPadding: EdgeInsets.symmetric(horizontal: 12.0),
          children: <Widget>[
            OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey[100],
              borderSide: BorderSide(
                color: Colors.black,
              ),
              //可在控件中设置也可以在Theme设置
              // color: Theme.of(context).accentColor,
              textColor: Colors.black,
              // textTheme: ButtonTextTheme.primary,
              highlightedBorderColor: Colors.grey,
            ),
            OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey[100],
              borderSide: BorderSide(
                color: Colors.black,
              ),
              //可在控件中设置也可以在Theme设置
              // color: Theme.of(context).accentColor,
              textColor: Colors.black,
              // textTheme: ButtonTextTheme.primary,
              highlightedBorderColor: Colors.grey,
            ),
          ],
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            floatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
