import 'package:flutter/material.dart';

class SortingSelector extends StatefulWidget {
  const SortingSelector({Key? key}) : super(key: key);

  @override
  _SortingSelectorState createState() => _SortingSelectorState();
}

class _SortingSelectorState extends State<SortingSelector> {
  final List<Map<String, dynamic>> sortingOptions = [
    {"text": "Sort by price", "icon": Icons.money},
    {"text": "Sort by distance", "icon": Icons.location_on},
    {"text": "Sort by rating", "icon": Icons.star},
  ];

  Map<String, dynamic> selectedOption = {
    "text": "Sort by price",
    "icon": Icons.sort,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSortingOptions(context, sortingOptions, selectedOption);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(selectedOption["icon"]),
          SizedBox(width: 8),
          Text(selectedOption["text"]),
        ],
      ),
    );
  }

  Future<void> _showSortingOptions(
      BuildContext context,
      List<Map<String, dynamic>> sortingOptions,
      Map<String, dynamic> selectedOption) async {
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
                      leading: Icon(option["icon"]),
                      title: Text(option["text"]),
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
      setState(() {
        selectedOption = option;
      });
    }
  }
}
