import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/pages/Favorite.dart';
import 'package:hello/pages/Order.dart';
import 'package:hello/pages/Profile.dart';
import 'package:hello/pages/home.dart';
import 'counter.dart';

final counter = Counter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mobX',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.white,
          accentColor: Colors.brown),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  PageController pageController = new PageController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: PageView(
          children: [
            Home(),
            Favorite(),
            Order(),
            Profile(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.navigation), label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }
}

class PadDead extends StatefulWidget {
  const PadDead({
    Key? key,
  }) : super(key: key);

  @override
  _PadDeadState createState() => _PadDeadState();
}

class _PadDeadState extends State<PadDead> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35.0),
              topLeft: Radius.circular(35.0),
            ),
            color: Colors.white),
        child: orderColumn(),
      ),
    );
  }

  Column orderColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  shadowColor: Colors.blue,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage("images/pizza.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order number',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      'Pep.pizza Medium',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                    ),
                    Text(
                      'Dominos price',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 130,
                  child: Text(
                    'See Details',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Stepper(
          currentStep: counter.index,
          onStepCancel: () {
            if (counter.index > 0) {
              setState(() {
                counter.index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (counter.index <= 0) {
              setState(() {
                counter.index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              counter.index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('Order received'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Content for Step 1')),
            ),
            Step(
              title: Text('Order ready'),
              content: Container(
                  alignment: Alignment.centerLeft, child: const Text('')),
            ),
            Step(
              title: Text('Order picked up'),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1'),
              ),
            ),
            Step(
              title: Text('On the way'),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
