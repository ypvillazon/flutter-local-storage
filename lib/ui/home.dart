import 'package:flutter/material.dart';
import 'package:localstorage/preference/prefs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool data = false;

  @override
  void initState() {
    _load();
    super.initState();
  }

  _load() {
    Storage.data.then((v) => {
      setState(() {
        data = v ;
      })
    });
  }

  _save(v) {
    setState(() {
      data = v;
    });
    Storage.setData(v);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            child: Center(
                child: Card(
          color: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.save, size: 50, color: Colors.white),
                  title: Text("Dato", style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                      "salvado como " + ((data) ? "verdadero" : "falso "),
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Switch(
                        activeColor: Colors.white,
                        inactiveTrackColor: Colors.black45,
                        value: data,
                        onChanged: _save)
                  ]))
            ],
          ),
        ))),
      ),
    );
  }
}
