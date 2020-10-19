import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:app_tcc/app/modules/profile/repositories/interfaces/profile_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  IProfileRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = ProfileRepository(client);
  });

  group('ProfileRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ProfileRepository>());
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
