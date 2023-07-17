import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sorting_selector/sorting_selector_bloc.dart';

class SortingSelector extends StatelessWidget {
  SortingSelector({Key? key}) : super(key: key);

  final List<String> sortingOptions = ["price", "distance", 'seats'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SortingSelectorBloc, SortingSelectorState>(
        builder: (context, state) {
          if (state is SortingSelectorInitial) {
            return GestureDetector(
              onTap: () {
                _showSortingOptions(context, sortingOptions, state.opitons);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sort),
                  SizedBox(width: 8),
                  Text(state.opitons),
                ],
              ),
            );
          } else {
            return Text("Failed");
          }
        },
        listener: (context, state) {});
  }

  Future<void> _showSortingOptions(BuildContext context,
      List<String> sortingOptions, String selectedOption) async {
    final option = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Sort by",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: sortingOptions.length,
                  itemBuilder: (context, index) {
                    final option = sortingOptions[index];
                    return ListTile(
                      leading: Icon(Icons.sort),
                      title: Text(sortingOptions[index]),
                      onTap: () {
                        Navigator.of(context).pop(option);
                      },
                      selected: option == selectedOption,
                      selectedTileColor: Colors.grey.shade200,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (option != null) {

          BlocProvider.of<SortingSelectorBloc>(context)
              .add(SortingSelected(option));
          selectedOption = option;
    
    }
  }
}
