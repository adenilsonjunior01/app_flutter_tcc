import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:app_tcc/app/modules/registros/repositories/alergia_repository.dart';

void main() {
  AlergiaRepository repository;
  // MockClient client;

  setUp(() {
    // repository = AlergiaRepositoryRepository();
    // client = MockClient();
  });

  group('AlergiaRepositoryRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<AlergiaRepositoryRepository>());
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
