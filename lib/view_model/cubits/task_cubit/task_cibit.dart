import 'package:flutter/material.dart';

import 'task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<NamesStete> {
  TaskCubit() : super(InitNamesStete());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static TaskCubit get(context) {
    return BlocProvider.of<TaskCubit>(context);
  }

  TextEditingController nameController = TextEditingController();
  void clearText() {
    nameController.clear();
  }
    bool visible=false;
  List Names = [];
  String? item;
  void addToList() {
    Names.add(nameController.text);
    visible=false;
    nameController.clear();
    // print(Names);
    emit(AddNames());

  }

  void ClearList() {
    print('Cleared');
    Names.clear();
      visible=true;
    emit(ClearNames());
  }

  String return_names(i) {


    emit(ClearNames());
    return '${Names[i]}';

  }
}
