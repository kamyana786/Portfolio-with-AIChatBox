import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Hello I am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Awais Ahmad',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Software Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      onPressed: () {
                        _launchUrl('https://drive.google.com/file/d/1PPzxrNCckIc_3Ow7osuldcZFbQFOyZDQ/view?usp=drive_link');
                      },
                      child: Text('My Resume'),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.instagram.com/kamyana786?igsh=eXlrOHVlbzQ3aWw='); // Replace with your Instagram profile URL
                        },
                        icon: Icon(FontAwesomeIcons.instagram, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.linkedin.com/in/awais-ahmad-519789317?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app');
                        },
                        icon: Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://github.com/kamyana786');
                        },
                        icon: Icon(FontAwesomeIcons.github, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.threads.net/@kamyana786');
                        },
                        icon: Icon(FontAwesomeIcons.threads, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.facebook.com/kamyana786?mibextid=kFxxJD');
                        },
                        icon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://whatsapp.com/channel/0029Va8CpeJDOQIZYjJ7DI32');
                        },
                        icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.snapchat.com/add/kamyana786?share_id=ukpbH-Q6p-8&locale=en-US');
                        },
                        icon: Icon(FontAwesomeIcons.snapchat, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
