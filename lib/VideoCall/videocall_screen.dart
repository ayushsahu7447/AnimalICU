import 'package:animalicu/VideoCall/witgets/meeting_buttons_option.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config/jitsi_meet_methods.dart';

class VideoCallScreen extends StatefulWidget {
  static const String id = 'VideoCallScreen';
  
  VideoCallScreen({Key? key, }) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {



  late TextEditingController meetingIdController;
  late TextEditingController _nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;



  @override
  void initState() {
    meetingIdController = TextEditingController();
    super.initState();
    _nameController = TextEditingController(
      text: "Ayush Sahu"
    );
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    _nameController.dispose();
    JitsiMeet.removeAllListeners();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo[900],
        title: Text(
          'Animal ICU',
          style: TextStyle(
              fontSize: 18,color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.indigo[900],
        child: Center(
          child: Container(
            height: size.height / 1.7,
            width: size.width / 1.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Lets JOIN",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      autofocus: true,
                      controller: meetingIdController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Room ID");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35.0),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "ROOM ID",
                        hintStyle:
                        TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      autofocus: false,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Name");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35.0),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Name",
                        hintStyle:
                        TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0))),
                      color: Colors.amber,
                      highlightColor: Colors.white,
                      splashColor: Colors.amber,
                      child: const Text(
                        'JOIN',
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: _joinMeeting,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0))),
                      color: Colors.amber,
                      highlightColor: Colors.white,
                      splashColor: Colors.amber,
                      child: const Text(
                        'JOIN on Web',
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: _launchURL,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MeetingOption(
                    text: 'Mute Audio',
                    isMute: isAudioMuted,
                    onChange: onAudioMuted,
                  ),
                  SizedBox(height: 20),
                  MeetingOption(
                    text: 'Off Video',
                    isMute: isVideoMuted,
                    onChange: onVideoMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }


  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: _nameController.text,
    );
  }

  _launchURL() async {
    late final uri = 'https://meet.jit.si/${meetingIdController.text}';
    late String url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
