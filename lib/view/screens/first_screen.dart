import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_task/model/secound_screen.dart';
import 'package:state_management_task/view_model/cubits/task_cubit/task_cibit.dart';
import 'package:state_management_task/view_model/cubits/task_cubit/task_state.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Names 1 ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Form(
            key: TaskCubit.get(context).formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Colors.white,
                  ),
                  onPressed: () => TaskCubit.get(context).ClearList(),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(),
                        ));
                    //
                  },
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TaskCubit, NamesStete>(builder: (context, state) {
            return Expanded(
              child: Visibility(
                visible: TaskCubit.get(context).visible,
                child: Column(
                  children: [
                    Icon(
                      Icons.adb_outlined,
                      color: Colors.white,
                      size: 100,
                    ),
                    Text('No Names Add Yet',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            );
          }),
          Expanded(

            child: BlocBuilder<TaskCubit, NamesStete>(
              builder: (context, state) {
                print(state);
                return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(2),
                            child: Column(
                              children: [
                                Text(
                                  TaskCubit.get(context).Names[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ));
                      },
                      itemCount: TaskCubit.get(context).Names.length,
                    ));
              },
            ),
          ),
          Container(
            width: double.infinity,
            // height: 120,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: TextFormField(
                  controller: TaskCubit.get(context).nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Enter Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    helperText: 'Enter Name',
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 1, 1, 30),
                  child: IconButton(
                    onPressed: () {
                      if (TaskCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        // print(TaskCubit.get(context).nameController.text);
                        TaskCubit.get(context).addToList();

                        // TaskCubit.get(context).clearText();
                      }
                    },
                    icon: Icon(Icons.send_outlined),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
