import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(location),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.names[index].name,
                          style: TextStyle(
                              fontSize: 5.w, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Addis Ababa, Ethiopia")
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is NamesError) {
          // Error occurred, display error message
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is NamesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Fallback case
        return Container();
      },
    );
  }
}
