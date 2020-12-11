import 'package:flutter/material.dart';

class OrderHostory extends StatefulWidget {
  final ordhData;
  OrderHostory(this.ordhData);
  @override
  _OrderHostoryState createState() => _OrderHostoryState();
}

class _OrderHostoryState extends State<OrderHostory> {
  @override
  Widget build(BuildContext context) {
    print("fgf ${widget.ordhData['orderdo']}");
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
        title: Image.asset(
          "assets/images/1app-02.png",
          height: 60,
          width: 100,
        ),
      ),
      body: ListView.builder(
          itemCount: widget.ordhData['orderh'].length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 0.5, right: 0.5),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          color: Colors.white,
                          child:
                              Image.network("https:${widget.ordhData['logo']}"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.ordhData['ordname'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey.shade700,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order: ",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    (widget.ordhData['orderdo'] == "0")
                                        ? Text(
                                            "${String.fromCharCode(036)}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Text(""),
                                    (widget.ordhData['orderdo'] == "0")
                                        ? Text(
                                            widget.ordhData['orderh'][index]
                                                .requestedAmount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Text(
                                            widget.ordhData['orderh'][index]
                                                .requestedShares
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Status: ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ordhData['orderh'][index].status,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Date: ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ordhData['orderh'][index].createdAt,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}
