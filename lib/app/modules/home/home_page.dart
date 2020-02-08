import 'package:flutter/material.dart';
import 'package:flutter_app_mobx/app/modules/home/home_controller.dart';
import 'package:flutter_app_mobx/app/modules/home/home_module.dart';
import 'package:flutter_app_mobx/app/shared/models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "ToDO List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeModule.to.get<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (_, index) {
          TodoModel model = controller.list[index];
          return Text(model.title);
        },
      ),
    );
  }
}
