import 'package:flutter/material.dart';
import 'package:layout_basics_column_example/main.dart';
import 'package:layout_basics_column_example/widget/appbar_widget.dart';
import 'package:layout_basics_column_example/widget/examples_widget.dart';
import 'package:layout_basics_column_example/widget/items/layout_type.dart';
import 'package:layout_basics_column_example/widget/items/column_items.dart';

class RowColumnPage extends StatefulWidget {
  @override
  _RowColumnPageState createState() => new _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  bool isRow = false;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.min;
  int index = 0;

  void setLayout(int index) => setState(() => isRow = index == 0);

  MainAxisAlignment getMainAxisAlignment(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }

  void setMainAxisAlignment(int index) =>
      setState(() => mainAxisAlignment = getMainAxisAlignment(index));

  CrossAxisAlignment getCrossAxisAlignment(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
    }
    return CrossAxisAlignment.start;
  }

  void setCrossAxisAlignment(int index) =>
      setState(() => crossAxisAlignment = getCrossAxisAlignment(index));

  void setMainAxisSize(int index) => setState(
      () => mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max);

  Widget buildContent() {
    final children = [
      FlutterLogo(size: 50),
      FlutterLogo(size: 100),
      FlutterLogo(size: 50),
    ];

    if (isRow) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return Scaffold(
          appBar: AppBarWidget(
            layoutType: LayoutType.column,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(160),
              child: buildBottom(),
            ),
          ),
          body: Container(color: Colors.yellow, child: buildContent()),
          bottomNavigationBar: buildBottomBar(),
        );
      case 1:
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(MyApp.title),
            centerTitle: true,
          ),
          body: ExamplesWidget(),
          bottomNavigationBar: buildBottomBar(),
        );
    }
  }

  Widget buildBottom() => RowColumnItems(
        onChangedLayout: setLayout,
        onChangedMainAxisAlignment: setMainAxisAlignment,
        onChangedCrossAxisAlignment: setCrossAxisAlignment,
        onChangedMainAxisSize: setMainAxisSize,
      );

  Widget buildBottomBar() => BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Walkthrough',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort_by_alpha),
            label: 'Examples',
          ),
        ],
        onTap: (index) => setState(() => this.index = index),
      );
}
