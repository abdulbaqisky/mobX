import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Order Status',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 25,
                ),
                Text('place sha',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),

        // Wrapping in the Observer will automatically re-render on changes to counter.value
        PadDead(),
      ],
    );
    //
  }
}
