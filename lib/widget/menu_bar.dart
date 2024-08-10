// import 'package:flutter/material.dart';
// import 'package:weather_app/services/web_view.dart';

// class menuBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.only(top: 50),
//         children: <Widget>[

//           ListTile(
//             leading: Icon(Icons.facebook),
//             title: Text('Profile'),
//             onTap: ()  {       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context){
            
//   return webviewExample();


// }
            
//           )

//         );},
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
       
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class menuBar extends StatelessWidget {
  const menuBar({super.key});

  Future<void> _launchLinkedInProfile() async {
    const url = 'https://www.linkedin.com/in/hosam-adel-65a450284';
    final Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        print('Could not launch $url');
      }
    } else {
      print('Cannot launch URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 50),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Profile'),
            onTap: _launchLinkedInProfile,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
