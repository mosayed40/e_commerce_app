import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/chick_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // print("🔍 Verify Response Raw => ${response.body}");
          return Right(responsebody);
        } else {}
        return Left(StatusRequest.serverfailure);
      } else {
        return Left(StatusRequest.offlinefailure);
      }
    } catch (err) {
      print(" =================catch ================== ");
      print(err);
      return Left(StatusRequest.serverexception);
    }
  }
}
