import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/example_bloc.dart';
import 'views/example_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => ExampleBloc(),
        child: ExamplePage(),
      ),
    ),
  );
}
