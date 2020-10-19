import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/qr_code_repository_interface.dart';

part 'qr_code_repository.g.dart';

@Injectable()
class QrCodeRepository implements IQrCodeRepository {
  final DioForNative client;

  QrCodeRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
