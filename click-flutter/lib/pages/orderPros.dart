import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProspectusWeb extends StatefulWidget {
  final prourl;
  ProspectusWeb(this.prourl);
  @override
  _ProspectusWebState createState() => _ProspectusWebState();
}

class _ProspectusWebState extends State<ProspectusWeb> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    print("Ddkd");
    print(widget.prourl);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
              child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.prourl))
        ],
      ),
    );
  }
}
