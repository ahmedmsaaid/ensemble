import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_task/view/screens/first_screen.dart';
import 'package:state_management_task/view_model/cubits/task_cubit/task_cibit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit(),),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: FirstScreen(

        ),
      ),
    );
  }
}
