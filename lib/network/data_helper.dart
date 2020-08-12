import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

///参数加密工具
class DataHelper {
  static encryptParams(Map<String, dynamic> map) {
    var buffer = StringBuffer();
    map.forEach((key, value) {
      buffer.write(key);
      buffer.write(value);
    });

    buffer.write("SERECT");
    var sign = string2MD5(buffer.toString());
    print("sign--->" + sign);
    return sign;
  }

  static string2MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
