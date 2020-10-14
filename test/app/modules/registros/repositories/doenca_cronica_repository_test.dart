import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:app_tcc/app/modules/registros/repositories/doenca_cronica_repository.dart';

void main() {
  DoencaCronicaRepository repository;
  // MockClient client;

  setUp(() {
    // repository = DoencaCronicaRepository();
    // client = MockClient();
  });

  group('DoencaCronicaRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<DoencaCronicaRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
