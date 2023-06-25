import 'package:mapbox_api/mapbox_api.dart';

const String mapUrl =
    'https://api.mapbox.com/styles/v1/natnael-tadele/cliu6ltsm00tf01qv7ml277v8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmF0bmFlbC10YWRlbGUiLCJhIjoiY2xpdTFxajY5MGVhdjNubXk2ZGpwZzkxNyJ9.kItia4BZW9XJVtTw2N-m9A';

const String accessToken =
    'pk.eyJ1IjoibmF0bmFlbC10YWRlbGUiLCJhIjoiY2xpdTFxajY5MGVhdjNubXk2ZGpwZzkxNyJ9.kItia4BZW9XJVtTw2N-m9A';

final String mapTypeId = 'mapbox.mapbox-streets-v8';

MapboxApi mapbox = MapboxApi(
  accessToken:
      'sk.eyJ1IjoibmF0bmFlbC10YWRlbGUiLCJhIjoiY2xpdzdtN2JhMGM1NTNsbXB4cWV1dm1qciJ9.cMk-UdoNRZYNAbzrXuVtvQ',
);
