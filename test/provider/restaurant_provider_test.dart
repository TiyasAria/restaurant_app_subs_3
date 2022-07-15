import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:reaturant_app/data/api/test_api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reaturant_app/data/model/model.dart';

import 'restaurant_provider_test.mocks.dart';


@GenerateMocks([http.Client])
void main()  {
  group('fetchRestaurant', () {
    test('Mengembalikan JSON restaurant', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list'))).thenAnswer((_) async =>
          http.Response('{"error":false,"message":"success","count":20,"restaurants":[]}', 200)
      );

      expect(await fetchRestaurant(client),  isA<RestaurantResult>());
    });


  });
}