import 'package:flutter/material.dart';

class MyContainerItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  MyContainerItem(this.icon, {this.color = Colors.blue, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      width: 60,
      height: 60,
      child: Icon(
        this.icon,
        size: this.size,
        color: Colors.white,
      ),
    );
  }
}

//水平布局
class RowDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          MyContainerItem(Icons.home, color: Colors.green),
          MyContainerItem(Icons.map, color: Colors.yellow),
          MyContainerItem(Icons.margin, color: Colors.red),
        ],
      ),
    );
  }
}

//竖直布局
class ColumnDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          MyContainerItem(Icons.home, color: Colors.green),
          MyContainerItem(Icons.map, color: Colors.yellow),
          MyContainerItem(Icons.margin, color: Colors.red),
        ],
      ),
    );
  }
}

//Expanded组件
class ExpandedDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blueAccent,
      child: Row(
        children: [
          Expanded(
              flex: 1, child: MyContainerItem(Icons.home, color: Colors.green)),
          Expanded(
              flex: 2, child: MyContainerItem(Icons.map, color: Colors.red)),
        ],
      ),
    );
  }
}

//组合练习
class RowColumnExpandedDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: 400,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              'https://www.itying.com/images/flutter/1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                  child: Image.network(
                                    'https://www.itying.com/images/flutter/2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Image.network(
                                    'https://www.itying.com/images/flutter/5.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
