class DestinationModel {
  final String name;

  DestinationModel({
    required this.name,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
        name: json['name'][0]['query']
        );
  }

}




// class DestinationModel {
//   final String name;

//   DestinationModel({
//     required this.name,
//   });

//   factory DestinationModel.fromJson(Map<String, dynamic> json) {
//     List<dynamic> destinations = json['destination'];
  

//     List<DestinationModel> Destinations = destinations
//         .map((destination) => DestinationModel.fromJson(destination))
//         .toList();

//     return DestinationModel(
//         name: json['name'][0]['query']
//         );
//   }

// }


