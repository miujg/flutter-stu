// 用于请求方法封装

import 'package:dio/dio.dart';

// 相关配置
BaseOptions options = new BaseOptions(
    // baseUrl: 'http://10.10.0.13:8766',
    baseUrl: 'https://m.up678.com',
    connectTimeout: 10000,
    receiveTimeout: 3000,
    headers: {
      'userid': '37',
      'seckey': 'f842278fbdb0e7304e915b4d6c21a1fb',
    });

Dio dio = new Dio(options);
