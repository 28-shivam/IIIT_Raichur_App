import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/example_bloc.dart';
import '../blocs/example_event.dart';
import '../blocs/example_state.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLoC Example')),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          if (state is ExampleInitial) {
            return Center(child: Text('Press the button to fetch data'));
          } else if (state is ExampleLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ExampleLoaded) {
            return Center(child: Text(state.data));
          } else if (state is ExampleError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ExampleBloc>().add(FetchDataEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
