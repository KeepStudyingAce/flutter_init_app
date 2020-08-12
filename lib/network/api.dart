import 'http_manager.dart';
import 'url_path.dart';

/// 所有接口类
class Api {
  ///示例请求
  static request(Map<String, dynamic> param) {
    return HttpManager.getInstance().get(UrlPath.testPath, params: param);
  }

  static requestOther(Map<String, dynamic> param) {
    return HttpManager.getInstance(baseUrl: UrlPath.otherUrl)
        .post(UrlPath.testPath, params: param);
  }
}
