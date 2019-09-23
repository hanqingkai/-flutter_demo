
import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Drawer(
          child: ListView(
            children: <Widget>[
              // DrawerHeader(
              //   child: Text('header'.toUpperCase()),
              //   decoration: new BoxDecoration(color: Colors.grey[100]),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text(
                  '韩庆凯',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('892706582@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568115263774&di=60d6ae52a779d3035aee00c4d9eda96d&imgtype=0&src=http%3A%2F%2Fpic33.nipic.com%2F20130924%2F9822353_015119969000_2.jpg'),
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568115263774&di=60d6ae52a779d3035aee00c4d9eda96d&imgtype=0&src=http%3A%2F%2Fpic33.nipic.com%2F20130924%2F9822353_015119969000_2.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white24.withOpacity(0.6),
                            BlendMode.hardLight))),
              ),
              ListTile(
                title: Text(
                  'Message',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.message, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                onTap: () => Navigator.pop(context),
                title: Text(
                  'Favorite',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.favorite, color: Colors.black12, size: 22.0),
              ),
              ListTile(
                onTap: () => Navigator.pop(context),
                title: Text(
                  'Settings',
                  textAlign: TextAlign.right,
                ),
                trailing:
                    Icon(Icons.settings, color: Colors.black12, size: 22.0),
              ),
            ],
          ),
        ),
    );
  }
}