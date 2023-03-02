import 'package:flutter/material.dart';


class CardData extends StatelessWidget {

  final String type;
  final String description;
  final double amount;
  final bool state;

  const CardData({super.key, required this.type, required this.description, required this.amount, required this.state});

  @override
  Widget build(BuildContext context) {
    
    var screenSize = MediaQuery.of(context).size.width;

    return Container(
      width: screenSize,
      margin: EdgeInsets.only(right: 10, top: 10, left: 10),
      child: Row(
        children: [
          Container(
            child: Expanded(
              child: Card(
                elevation: 6,
                //color: Color.fromARGB(255, 185, 184, 184),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: state == true 
                        ? Icon(Icons.arrow_drop_up, color: Colors.green, size: 50,)
                        : Icon(Icons.arrow_drop_down, color: Colors.red, size: 50,)
                      ),
                      Container(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(type, style: TextStyle(fontSize: 14),),
                            SizedBox(height: 5,),
                            Text(description, style: TextStyle(fontSize: 20), overflow: TextOverflow.clip, maxLines: 2,),
                            //SizedBox(width: 15,),
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.green,
                        child: Row(
                          children: [
                            
                            SizedBox(width: 10,),
                            Icon(Icons.monetization_on),
                            SizedBox(width: 5,),
                            Text('${amount.round()}', style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis, ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}