// 用于请求方法封装

import 'package:dio/dio.dart';

// 相关配置
BaseOptions options = new BaseOptions(
    baseUrl: 'http://10.10.0.13:8766',
    connectTimeout: 10000,
    receiveTimeout: 3000);

Dio dio = new Dio(options);
