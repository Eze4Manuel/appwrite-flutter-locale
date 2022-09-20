// import 'dart:ui';
//
// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/appwrite.dart';
// import 'package:flutter/material.dart';
//
// import '../constants/app_constants.dart';
//
// class LocaleApi {
//   Client client = Client();
//   Locale locale = Locale(client);
//
//
//   Locale(Client client) {
//     _init();
//   }
//   _init() {
//     Locale locale = Locale(client);
//
//     client
//         .setEndpoint(Appconstants.endpoint)
//         .setProject(Appconstants.projectid);
//
//     Future result = locale.get();
//
//   }
//
//   _checkisLoggedin() async{
//     try{
//       _user = await _getaccount();
//       _isLoggedin = true;
//       notifyListeners();
//     }catch(e){
//       print(e);
//     }
//   }
//
//   Future<dynamic>_getaccount() async{
//     try {
//       final res = await account?.get();
//       print('res?.status');
//
//       if(res?.status != null || res?.status == true){
//
//         return res;
//       }else{
//         return null;
//       }
//     } catch (e) {
//       throw(e);
//     }
//   }
//
//   // Future<LoadUser?>_getaccount() async{
//   //   try {
//   //     Response <String, dynamic> res = await account.get();
//   //     if(res.runtimeType == true){
//   //       return LoadUser.fromJson(res.data);
//   //     }else{
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     throw(e);
//   //   }
//   // }
//   login(String email, String password) async {
//     try {
//       var result =
//       await account!.createEmailSession(email: email, password: password);
//
//       if(result.userId == null){
//         return false;
//       }else{
//         return await _getaccount();;
//       }
//
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   signup(String name, String email, String password) async {
//     try {
//       var result = await account!.create(
//           userId: 'unique()', name: name, email: email, password: password);
//       print(result.$id);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
