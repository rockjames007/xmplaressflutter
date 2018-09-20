import 'package:flutter/material.dart';
import 'package:xmplaressflutter/menu/fragment/Home/HomeFragment.dart';
import 'package:xmplaressflutter/menu/fragment/Personalinfo/PersonalInformation.dart';
void main() => runApp(menu(int ));
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
class menu extends StatelessWidget{
  int _selectedDrawerIndex;
  menu(pos)
  {
    _selectedDrawerIndex = pos;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new menuPage(_selectedDrawerIndex),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData
          (
            primarySwatch: Colors.blue
        )
    );
  }

}
class menuPage  extends StatefulWidget
{ int _selectedDrawer;
  final drawerItems = [
  new DrawerItem(" HOME", Icons.home),
  new DrawerItem(" PERSONAL", Icons.person),
  new DrawerItem(" LMS", Icons.perm_contact_calendar),
  new DrawerItem(" TIME SHEET", Icons.timeline),
  new DrawerItem(" EOD REPORT", Icons.timer),
];
menuPage(int _selectedDrawerIndex)
{
  _selectedDrawer=_selectedDrawerIndex;
}
@override
State<StatefulWidget> createState() {
  return new menuPageState(_selectedDrawer);
}
}

class menuPageState extends State<menuPage> {
  int _selectedDrawerIndex;
  menuPageState(int pos) {
    _selectedDrawerIndex = pos;
  }
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new PersonalInformation();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState((){
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Container(
        child: Row(
            children: <Widget>[
              Icon(widget.drawerItems[_selectedDrawerIndex].icon),
              Text(widget.drawerItems[_selectedDrawerIndex].title)
          ],

        ),
        ),
        backgroundColor: Color.fromRGBO(13, 80, 121 , 1.0),
      ),
      drawer: new Drawer(
          child: new Container(decoration: new BoxDecoration(color: Colors.white),
          child: new ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget> [
              new UserAccountsDrawerHeader(
                  
                  accountName: new Text("Dipu S James"), 
                  currentAccountPicture: new Image.asset("assets/xmplarlogo.png"),
                  accountEmail:  new Text("dipujames7@gmail.com"),
                  decoration: new BoxDecoration(color: Color.fromRGBO(13, 80, 121 , 1.0),
                      
                  )
              ),
              new ListTile(
                title: new Text('HOME'),
                leading: new Icon(Icons.home),
                onTap: () => _onSelectItem(0),
                selected: 0 == _selectedDrawerIndex,

              ),
              new Divider(),
              new ListTile(
                title: new Text('PERSONAL'),
                leading: new Icon(Icons.person),
                onTap: () {
                  _onSelectItem(1);
                  },
                selected: 1== _selectedDrawerIndex,
              ),
              new Divider(),
              new ListTile(
                title: new Text('LMS'),
                leading: new Icon(Icons.perm_contact_calendar),
                onTap: () => _onSelectItem(2),
                selected: 2== _selectedDrawerIndex,
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.timeline),
                title: new Text('TIME SHEET'),
                onTap: () => _onSelectItem(3),
                selected: 3== _selectedDrawerIndex,
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.timer),
                title: new Text('EOD REPORT'),
                onTap: () => _onSelectItem(4),
                selected: 4== _selectedDrawerIndex,
              ),
              new Divider(),
            ],
          )
          )
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}