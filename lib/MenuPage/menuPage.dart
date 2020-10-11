import 'package:demo/Login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isLogin = false;
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      setState(() {
        _isLogin = true;
      });
    }
  }  

  @override
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogin ? Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: (BorderRadius.circular(50)),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "images/person.png"))),
              ),
              Container(
                width: 40,
              ),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.green,
                onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => true);
                },
                child: Text('Đăng nhập'),
              )
            ],
          ),
        )])  : Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: (BorderRadius.circular(50)),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://vignette.wikia.nocookie.net/trinity-seven/images/8/8d/Mira_Akio_Arin_Yui_Lieselotte_Lilith_Arata_Levi_cover_GA.jpg/revision/latest?cb=20190712040116'))),
              ),
              Container(
                height: 20,
                width: 20,
              ),
              Text(
                'Nguyễn Việt Hoàng',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person_outline),
                Container(
                  width: 10,
                ),
                Text("Thông tin cá nhân",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Container(
                  width: 160,
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.power_settings_new),
                Container(
                  width: 1,
                ),
                          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => true);
            },
            child: Text('Đăng xuất',style: TextStyle(fontSize: 16),),
          )
              ],
            )),
      ],
    );
  }
}