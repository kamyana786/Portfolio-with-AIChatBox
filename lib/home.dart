import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showWhatsAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WhatsApp'),
          content: Text('Do you want to chat with Awais?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Chat'),
              onPressed: () {
                _launchURL('https://wa.me/923267733647');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Call'),
          content: Text('Do you want to call Awais?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Call'),
              onPressed: () {
                _launchURL('tel:+923267733647');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text('Do you want to message Awais?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Message'),
              onPressed: () {
                _launchURL('sms:+923267733647');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Colors.black,
          icon: Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                child: Text('Projects', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'projects');
                },
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text('About Me', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text('Contact', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'contact');
                },
              ),
              value: 3,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text('Ai Chat', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'chat_screen');
                },
              ),
              value: 4,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.38, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: ShaderMask(
                  shaderCallback: (react) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, react.width, react.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/aak.jpg',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                child: Column(
                  children: [
                    Text(
                      'Awais Ahmad',
                      style: TextStyle(
                        fontFamily: "Soho",
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        fontFamily: "Soho",
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 85,
                left: 10,
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () => _showWhatsAppDialog(context),
                      child: Icon(FontAwesomeIcons.whatsapp),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _showCallDialog(context),
                      child: Icon(Icons.phone),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _showMessageDialog(context),
                      child: Icon(Icons.message),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://www.facebook.com/kamyana786?mibextid=kFxxJD'),
                      child: Icon(FontAwesomeIcons.facebook),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://www.threads.net/@kamyana786/'),
                      child: Icon(FontAwesomeIcons.threads),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 85,
                right: 10,
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://www.linkedin.com/in/awais-ahmad-519789317?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
                      child: Icon(FontAwesomeIcons.linkedin),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://www.instagram.com/kamyana786?igsh=eXlrOHVlbzQ3aWw=/'),
                      child: Icon(FontAwesomeIcons.instagram),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://www.snapchat.com/add/kamyana786?share_id=ukpbH-Q6p-8&locale=en-US'),
                      child: Icon(FontAwesomeIcons.snapchat),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('mailto:kamyana786138@gmail.com'),
                      child: Icon(Icons.email),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () => _launchURL('https://github.com/kamyana786/'),
                      child: Icon(FontAwesomeIcons.github),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      mini: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchiev('15', ' Projects'),
                    myAchiev('30', ' Clients'),
                    myAchiev('92', ' Messages'),
                  ],
                ),
                SizedBox(height: 30),
                Text('Specialized In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.android, 'Android'),
                        mySpec(Icons.flutter_dash, 'Flutter'),
                        mySpec(FontAwesomeIcons.webflow, 'Web Dev'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.no_photography, 'Graphic'),
                        mySpec(Icons.adobe, 'Adobe Ph'),
                        mySpec(Icons.adobe, 'Adobe Pr'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.facebook, 'Facebook Ads'),
                        mySpec(Icons.shopify, 'Shopify'),
                        mySpec(Icons.tiktok, 'Tiktok Ads'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),

        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'projects');
              break;
            case 1:
              Navigator.pushNamed(context, 'about');
              break;
            case 2:
              Navigator.pushNamed(context, 'contact');
              break;
          }
        },
      ),
    );
  }

  Widget myAchiev(String num, String type) {
    return Row(
      children: [
        Text(num,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        )
      ],
    );
  }

  Widget mySpec(IconData icon, String tech) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(height: 10),
              Text(
                tech,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
