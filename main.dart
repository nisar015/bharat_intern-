import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  )); // MaterialApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController temperatureController = TextEditingController();
  String _infoText = "Converted Temperature";
  String? _value = null;
  List<String> _values = <String>[];

  void _resetFields() {
    temperatureController.text = "";
    setState(() {
      _infoText = "Converted Temperature";
    });
  }

  @override
  void initState() {
    _values.addAll(['Kelvin', 'Fahrenheit']);
    _value = _values.elementAt(0);
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  void converter() {
    if (_value == 'Kelvin') {
      setState(() {
        _infoText = (double.parse(temperatureController.text) + 273).toStringAsPrecision(3);
      });
    }
    if (_value == 'Fahrenheit') {
      setState(() {
        _infoText = ((double.parse(temperatureController.text) * 1.8) + 32).toStringAsPrecision(3);
      });
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Temperature Converter"),
          backgroundColor: Colors.purple[400],
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.deepPurple[100],
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(40.0, 2.0, 40.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/images/pngwing.com.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        
                         border: InputBorder.none,
                    // borderRadius:BorderRadius.circular(12),
                    hintText
                    : 'Temperature(in celsius)',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                      
                      controller: temperatureController,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 50.0,
              ),
              SizedBox(
                width: 75.0,
                height: 50.0,
                child: DropdownButton(
                    value: _value,
                    items: _values.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text('${value}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0)),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _onChanged(value!);
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      converter();
                    }, // faz conversao
                    child: Text("CONVERT",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                   
                  ),
                ),
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ],
          ),
        ));
  }
}