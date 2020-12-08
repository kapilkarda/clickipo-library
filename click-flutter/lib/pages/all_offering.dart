import 'package:flutter/material.dart';
import 'offering_details.dart';

class AllOffering extends StatefulWidget {
  @override
  _AllOfferingState createState() => _AllOfferingState();
}

class _AllOfferingState extends State<AllOffering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OfferingDetails()));
        },
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.yellow.shade100,
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                            Center(
                              child: Text(
                                "MSFT",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Engineer Master \nSolutions Pvt Ltd",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF8bc53f),
                                        ),
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 5),
                                      child: Text(
                                        "Interested?",
                                        style: TextStyle(color: Color(0xFF8bc53f)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Anticipated Date:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text("TBD",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Anticipated Price: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text("TBD",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
                ],
              );
            }),
      ),
    );
  }
}
