import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RuleTwoWeb extends StatefulWidget {
  @override
  _RuleTwoWebState createState() => _RuleTwoWebState();
}

class _RuleTwoWebState extends State<RuleTwoWeb> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF649f49),
          ),
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/1app-02.png",
          height: 60,
          width: 100,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl:
                      "https://cdn.clickipo.com/assets/finrarules/FINRARule5131.html"))
        ],
      ),
    );
  }
}
