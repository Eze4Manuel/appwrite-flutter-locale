import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/authenticate.dart';
import '../constants/app_constants.dart';
import '../data/userdata.dart';

class Mainhomepage extends StatefulWidget {
  late var user;

  Mainhomepage({super.key,  required this.user});

  @override
  State<Mainhomepage> createState() => _MainhomepageState();
}

class _MainhomepageState extends State<Mainhomepage> {
  late Future localization;
  late var localeData;
  bool loading = true;

  void initializeLocaleAPI(){
    Client client = Client();
    Locale locale = Locale(client);
    client
        .setEndpoint(Appconstants.endpoint)
        .setProject(Appconstants.projectid);
    localization = locale.get();

    localization
        .then((response) {
      localeData = response;
      setState((){
        loading = false;
      });
    }).catchError((error) {
      print(error.response);
    });

  }
  @override
  void initState() {
    initializeLocaleAPI();
    super.initState();
  }

  // Authenticate state = Provider.of<Authenticate>(context, listen: false);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    print('widget.user');

    return Scaffold(
      key: scaffoldKey,
      appBar:
      AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Mainhomepage(user: widget.user,)));
            },
            child: const Text(
              'Swagga',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0x5AF1F4F8),
              ),
            ),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer<Authenticate>(
                  builder: (context, state, child) {
                    if (!state.isLoggedin) return Text( "welcome,${widget.user?.name }"  );
                    return Text(
                        state.user?.name ?? ''
                    );
                  },)
            ),
          )
        ],
        // actions: [
        //   Expanded(
        //     child: Consumer<Authenticate>(
        //       builder: (context, state, child) {
        //         if (!state.isLoggedin) return Container();
        //         return Text(
        //           state.user?.name ?? ''
        //         );
        //       },)
        //   )
        // ],
        centerTitle: true,
        elevation: 0,
      ),
      body: loading ? const CircularProgressIndicator(
        color: Colors.blue,
      ) : Consumer<Authenticate>(
        builder: (context, state, child) {
          if (!state.isLoggedin) return Container();
          return  ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  Row(
                    children: [
                      const Center(
                        child: Text(
                           'Name:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            widget.user?.name ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'IP:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.ip,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'Country Code:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.countryCode,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'Country:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.country,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'Continent Code:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.continentCode,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'Continent:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.continent,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Text(
                            'Currency:- ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      Center(
                        child: Text(
                            localeData.currency,
                            style: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),

                ]
            );
        },
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   Color hexToColor(String code) {
//     // ignore: unnecessary_new
//     return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
//   }

//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: hexToColor("#F2A03D"),
//       leading: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//         child: const Text.rich(
//           TextSpan(
//               text: 'Swagga',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               )),
//         ),
//       ),
//       actions: [
//         Container(
//           //   child:           Align(
//           //   alignment: Alignment.center,
//           //   child: FloatingActionButton.extended(
//           //       onPressed: () {
//           //       },
//           //       label: const Text('Signup')),
//           // ),
//           padding: const EdgeInsets.all(5),
//           alignment: Alignment.center,
//           child: Row(
//             children: [
//               FloatingActionButton.extended(
//                 onPressed: signup,
//                 elevation: 0,
//                 label: const Text('signup'),
//                 backgroundColor: hexToColor("#F2A03D"),
//               ),
//               const Padding(padding: EdgeInsets.all(5)),
//               FloatingActionButton.extended(
//                 onPressed: login,
//                 elevation: 0,
//                 label: const Text('login'),
//                 backgroundColor: hexToColor("#F2A03D"),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
}
