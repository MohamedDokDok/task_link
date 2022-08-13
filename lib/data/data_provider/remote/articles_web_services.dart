
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:link_task/shared/end_points.dart';

import 'exception.dart';

class ArticlesWebServices {
  late Dio dio;

  ArticlesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllArticles() async {
    try {
      Response response = await dio.get(
        EndPoints.articlesPath,
        queryParameters: {
          "country" : EndPoints.country,
          "category" : EndPoints.category,
          "apiKey" : EndPoints.apiKey
        }
      );
      //print("Data in Web Services ${response.data['articles']}");
      return returnResponse(response);
    }  on SocketException {
      //print("error in Web Services -------------}");
      throw FetchDataException('No Internet Connection');
    }
  }

  Future<Map<String, dynamic>> getArticlesSearched({
  required String txtSearch,
}) async {
    try {
      Response response = await dio.get(
          EndPoints.articlesSearchedPath,
          queryParameters: {
            "q" : txtSearch,
            "apiKey" : EndPoints.apiKey
          }
      );
      //print("Data in Web Services ${response.data['articles']}");
      return returnResponse(response);
    } on SocketException {
      //print("error in Web Services -------------}");
      throw FetchDataException('No Internet Connection');
    }
  }

  @visibleForTesting
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
