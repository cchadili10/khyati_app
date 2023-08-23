
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:khyati_app/model/model.dart';

import '../data/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE

    print('relooooooooooooooooooooooodddd');
  }

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('data'),
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
            ),
            ListTile(
              title: Text('Item_1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item_2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (() => scaffoldKey.currentState?.openDrawer()),
                    icon: Icon(Icons.dashboard)),
                Text(
                  "khyati",
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 36, 36),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fill');
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 235, 235),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Item>>(
              future: dbHelper.getAll(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data;
                  return ListView.builder(
                    itemCount: items!.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Padding(
                        padding: EdgeInsets.all(2),
                        child: InkWell(
                          onTap: (() {
                            print(item.name);
                          }),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Container(
                              height: 120,
                              width: 300,
                              child: Column(
                                children: [
                                  Text('jjsh')
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('err'),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
