import 'package:flutter_app_mobx/app/shared/models/todo_model.dart';
import 'package:flutter_app_mobx/app/shared/services/local_storage_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final LocalStorageService service;

  _HomeBase(this.service) {
    _init();
  }

  _init() async {
    final allList = await service.getAll();
    list.addAll(allList);
  }

  @action
  add(TodoModel model) async {
    model = await service.add(model);
    list.add(model);
  }

  @observable
  int value = 0;
  ObservableList<TodoModel> list = ObservableList<TodoModel>();

  @action
  void increment() {
    value++;
  }
}
