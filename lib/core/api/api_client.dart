import 'package:em_store/core/utils/app_constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  String token = "";
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstant.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}
