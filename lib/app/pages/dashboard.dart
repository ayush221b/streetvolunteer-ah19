import 'package:flutter/material.dart';
import 'package:streetvolunteer_ah19/app/scoped_models/main.dart';
import 'package:streetvolunteer_ah19/app/widgets/switcher.dart';

class Dashboard extends StatefulWidget {
  final MainModel model;

  const Dashboard({Key key, this.model}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreetVolunteer"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: controller.view,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add Campaign'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Switcher(widget.model, controller: controller),
    );
  }
}
