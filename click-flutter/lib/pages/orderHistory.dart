import 'package:flutter/material.dart';

class OrderHostory extends StatefulWidget {
  @override
  _OrderHostoryState createState() => _OrderHostoryState();
}

class _OrderHostoryState extends State<OrderHostory> {
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
        centerTitle: true,
        title: Text("Order History",
            style: TextStyle(color: Color(0xFF002b47), fontSize: 18)),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Text("hs");
          }),
    );
  }
}
