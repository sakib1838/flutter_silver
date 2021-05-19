import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Icon(Icons.person,size: 40,)
              ],
              leading: Icon(Icons.menu),
              backgroundColor: Colors.green,
              title: Text('Flutter Sliver'),
              floating: true,
              pinned: true,
            ),
            SliverFixedExtentList(delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red,),
                  Container(color: Colors.yellow),
                ]
            ),
                itemExtent: 50
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.orange,
                child: Text('Sliver To Box Adapter'),
                padding: EdgeInsets.all(16.0),
              ),
            ),
             SliverList(
               delegate: new SliverChildListDelegate(
                 _buildList(10)
               ),
             ),
            SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return new Container(
                height: 150.0,
                color: _randomPaint(index),
              );
            }

            ),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4
            )),

          ],
        ),
      ),
    );
  }
}

List _buildList(int count){
  List<Widget> items = List();
  for(int i =0;i<count;i++){
    items.add(
      new Padding(
        padding: EdgeInsets.all(10),
          child: new Text('Item ${i.toString()}', style: new TextStyle(fontSize: 20),))
    );
  }
  return items;
}

Color _randomPaint(int index) {
  if(index<21){
    if (index % 3 == 0) {
      return Colors.orange;
    } else if (index % 3 == 1) {
      return Colors.blue;
    }
    return Colors.red;
  }
}