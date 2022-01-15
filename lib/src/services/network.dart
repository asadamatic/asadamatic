import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:get/get.dart';

class NetworkService extends GetConnect {
  final url = localHostUrl;
  final packageData = 'packages/';

  Future<Package> getPackageData(String package) async {
    final response = await get(url + packageData + package);

    return Package.fromJson(response.body);
  }
}
