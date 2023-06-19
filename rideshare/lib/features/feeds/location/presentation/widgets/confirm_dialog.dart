import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/feeds/location/presentation/widgets/select_button.dart';

class SeatSelectionDialog extends StatefulWidget {
  final String source;
  final String destination;
  final int seatCount;
  final ValueChanged<int> onSeatCountChanged;
  final VoidCallback onConfirmPressed;

  const SeatSelectionDialog({
    super.key,
    required this.source,
    required this.destination,
    required this.seatCount,
    required this.onSeatCountChanged,
    required this.onConfirmPressed,
  });

  @override
  State<SeatSelectionDialog> createState() => _SeatSelectionDialogState();
}

class _SeatSelectionDialogState extends State<SeatSelectionDialog> {
  int currentSeatCount = 0;

  @override
  void initState() {
    super.initState();
    currentSeatCount = widget.seatCount;
  }

  void incrementSeatCount() {
    setState(() {
      currentSeatCount++;
    });
  }

  void decrementSeatCount() {
    setState(() {
      if (currentSeatCount > 0) {
        currentSeatCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFFFFF),
      title: Text(
        'Select Number of Seats \n and Confirm Price',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 16.sp,
          color: const Color(0xFF414141),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset('images/current_mocation_marker.svg'),
              SizedBox(width: 1.0.w),
              SizedBox(
                width: 30.w,
                child: Text(
                  widget.source,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16.sp,
                    color: const Color(0xFF414141),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0.h),
          Row(
            children: <Widget>[
              SvgPicture.asset('/images/Subtract.svg'),
              SizedBox(width: 1.0.h),
              SizedBox(
                width: 30.w,
                child: Text(
                  widget.destination,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16.sp,
                    color: const Color(0xFF414141),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total Price you will pay: ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  color: const Color(0xFF414141),
                ),
              ),
              Text(
                "Br 60 ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  color: const Color(0xFF414141),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Seats: $currentSeatCount'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: incrementSeatCount,
                      icon: const Icon(Icons.add),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(const Size(32, 32)),
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      color: Colors.grey,
                    ),
                    IconButton(
                      onPressed: decrementSeatCount,
                      icon: const Icon(Icons.remove),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(const Size(32, 32)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        SelectButton(
          buttonName: 'Confirm',
          onPressed: widget.onConfirmPressed,
        ),
      ],
    );
  }
}
