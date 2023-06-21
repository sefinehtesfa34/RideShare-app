import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/passenger_home_bloc.dart';

class DestinationList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamesBloc, NamesState>(
      builder: (context, state) {
        if (state is NamesInitial) {
          context.read<NamesBloc>().add(FetchNamesEvent());
          // Initial state, show loading indicator or empty screen
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NamesLoaded) {
          // Names loaded, display the list
          return ListView.builder(
            itemCount: state.names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.names[index]),
              );
            },
          );
        } else if (state is NamesError) {
          // Error occurred, display error message
          return Center(
            child: Text(state.errorMessage),
          );
        }

        // Fallback case
        return Container();
      },
    );
  }
}