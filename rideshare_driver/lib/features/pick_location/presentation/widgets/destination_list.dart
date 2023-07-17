import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/images.dart';
import '../../../../core/utils/colors.dart';
import '../bloc/passenger_home_bloc.dart';
import 'confirm_dialog.dart';

class DestinationList extends StatefulWidget {
  @override
  State<DestinationList> createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  int seatCount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamesBloc, NamesState>(
      builder: (context, state) {
        if (state is NamesInitial) {
          context.read<NamesBloc>().add(FetchNamesEvent());
          return Center();
        } else if (state is NamesLoaded) {
          // Names loaded, display the list
          return BlocListener<ChooseLocationsBloc, ChooseLocationsState>(
            listener: (context, state) {
              if (state is ChooseLocationsSucess) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SeatSelectionDialog(
                      source: state.sourceName,
                      destination: state.destinationName,
                      seatCount: seatCount,
                      onSeatCountChanged: (int count) {
                        setState(() {
                          seatCount = count;
                        });
                      },
                      onConfirmPressed: () {},
                    );
                  },
                );
              }
              if (state is ChooseLocationsError) {}
            },
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    final CurrentLocationBloc bloc =
                        BlocProvider.of<CurrentLocationBloc>(context,
                            listen: false);
                    final CurrentLocationState currentLocationState =
                        bloc.state;
                    if (currentLocationState is CurrentLocationSuccess) {
                      BlocProvider.of<ChooseLocationsBloc>(context).add(
                        SelectecLocationFromList(
                          state.names[index].latitude,
                          state.names[index].longitude,
                          state.names[index].name,
                          currentLocationState.location.latitude,
                          currentLocationState.location.longitude,
                        ),
                      );
                    }
                  },
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
                                fontSize: 4.w, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text("Addis Ababa, Ethiopia",
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 14.sp))
                        ],
                      ),
                    ],
                  ),
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
          return Padding(
            padding: EdgeInsets.all(3.h),
            child: SpinKitThreeBounce(
              color: primaryColor,
              size: 5.h,
            ),
          );
        }

        // Fallback case
        return Container();
      },
    );
  }
}
