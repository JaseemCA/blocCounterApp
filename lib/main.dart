import 'package:bloccounterapp/bloc/counter_bloc.dart';
import 'package:bloccounterapp/bloc/counter_events.dart';
import 'package:bloccounterapp/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: counterApp(),
      ),
    );
  }
}

class counterApp extends StatelessWidget {
  const counterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block couterapp"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.count.toString(),
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(AddCounterEvent());
          },
          child: const Icon(Icons.add)),
    );
  }
}
