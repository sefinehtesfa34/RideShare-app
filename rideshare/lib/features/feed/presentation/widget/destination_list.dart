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
          return Center();
        } else if (state is NamesLoaded) {
          // Names loaded, display the list
          return SizedBox(
            child: ListView.builder(
              itemCount: state.names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.names[index].name),
                );
              },
            ),
          );
        } else if (state is NamesError) {
          // Error occurred, display error message
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is NamesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Fallback case
        return Container();
      },
    );
  }
}
