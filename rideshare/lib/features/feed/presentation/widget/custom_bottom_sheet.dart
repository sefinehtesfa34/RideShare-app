import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feed/presentation/widget/where_to_go_button.dart';
import '../bloc/passenger_home_bloc.dart';
import 'destination_list.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleBottomSheet(
        // bottomSheetColor: Colors.amber,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        minHeight: 0.3,
        maxHeight: 0.7,
        initHeight: 0.4,
        bodyBuilder: (context, index) {
          return SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: WhereButton(),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.h),
                    child: DestinationList(),
                  )
                ],
              );
            },
            childCount: 1,
          );
        });
  }
}
  










// **************************************************************
// class CustomBottomSheet extends StatelessWidget {
//   const CustomBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 50.h,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(30),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 20,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(top: 6.h),
//           child: Column(
//             children: [
//               Positioned(child: WhereButton()),
//               BlocConsumer<PassengerHomeBloc, PassengerHomeState>(
//                 listener: (context, state) {
//                   if (state is FetchLoadingSuccessState) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 DestinationList(state.destination)));
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is FetchLoadingState) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (state is FetchLoadingFailureState) {
//                     return Text('failed to fetch');
//                   } else {
//                     return Text('to be ...');
//                   }
//                 },
//               )
//             ],
//           ),
//         ));
//   }
// }
