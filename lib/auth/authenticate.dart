import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as UserModel;
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/userdata.dart';

class Authenticate extends ChangeNotifier {
  Client client = Client();
  Account ? account;
  late bool  _isLoggedin;
  var _user;
  String ? _error;


  bool get isLoggedin => _isLoggedin;
  dynamic? get user => _user;
  String? get error => _error;

  Authenticate() {
    _init();
  }
  _init() {
    _isLoggedin = false;
    _user = null;
    client
        .setEndpoint(Appconstants.endpoint)
        .setProject(Appconstants.projectid);

    account = Account(client);
    print('setting up');
    _checkisLoggedin();
  }

  _checkisLoggedin() async{
    try{
      print('checking login');
      _user = await _getaccount();
      print('user');
      print(_user);
      _isLoggedin = true;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<dynamic>_getaccount() async{
    try {
      final res = await account?.get();
      if(res?.status != null || res?.status == true){
        return res;
      }else{
        return null;
      }
    } catch (e) {
      throw(e);
    }
  }

  // Future<LoadUser?>_getaccount() async{
  //   try {
  //     Response <String, dynamic> res = await account.get();
  //     if(res.runtimeType == true){
  //       return LoadUser.fromJson(res.data);
  //     }else{
  //       return null;
  //     }
  //   } catch (e) {
  //     throw(e);
  //   }
  // }
  login(String email, String password) async {
    try {
      var result =
          await account!.createEmailSession(email: email, password: password);
      print(result);
      print(result.userId);
      if(result.userId == null){
        return false;
      }else{
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  signup(String name, String email, String password) async {
    try {
      var result = await account!.create(
          userId: 'unique()', name: name, email: email, password: password);
      if(result.$id == null){
        return false;
      }else{
        return await _getaccount();
      }
    } catch (e) {
      print(e);
    }
  }
}
