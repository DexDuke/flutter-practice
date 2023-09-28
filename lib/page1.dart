import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedValue;

  // For simplicity, using a fixed rate here. You can use an API to get the current rate.
  static const double _usdToBdtRate =
      110.27; // 1 USD = 110.27 BDT (for example)

  void _convert() {
    double? usdValue = double.tryParse(_controller.text);
    if (usdValue != null) {
      setState(() {
        _convertedValue = usdValue * _usdToBdtRate;
      });
    } else {
      setState(() {
        _convertedValue = null;
      });
    }
  }


  void _reset(){
    _controller.clear();
    setState(() {
      _convertedValue=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USD to BDT converter',textAlign: TextAlign.center,style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 55, 55, 55),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _convertedValue != null ? '$_convertedValue BDT' : '0 BDT',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'Enter an Amount in USD',
                  prefixIcon: Icon(Icons.monetization_on),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 118, 118, 118),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _convert,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Convert'),
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                ElevatedButton(
                  onPressed: _reset,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Reset'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
