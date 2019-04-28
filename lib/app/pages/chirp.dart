import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:chirpsdk/chirpsdk.dart';
import 'package:simple_permissions/simple_permissions.dart';

/// Enter Chirp application credentials below
String _appKey = 'ee7ef2CB22afA8eade53bb2d1';
String _appSecret = '1BACC9DEbB48CA2dA2c4eFA5D45288257E6C3Fd9F66ddE67a0';
String _appConfig =
    'LOkEB7hTO0nzgEKiCzSahIVOSUHpoau2odkJ5+TGOPqtpZ+0kHVjCO4hGfoFjgVXjAwEothh+q43sGS5MIoSqB7IPkuvs+nyX4CfT0E6N3eRqW4NJsDr83wyu2xmmuSWwUWe9VdX7PhhVbLUx30EcoWBGtydiYA/kojGpv0FTT1uZsW8VMP29/GMrRaWOGJDZhaHLJnOw/UTVfm+yoVGSr3GR+fZXqHuNe99X5obac75FQIbRzsFTuvlJs1994L2ao1gDLDNuzrPYbprIQOw67/ccecI3AXdePez5Ra9CqPHpvEnbjm/yw3hoKeyxB+bujoYz1Skbt15TpLwzR3rMhcTnsiOWEFZAFAXyDAfXPQVCb3HOvJ+kk33hTSTNumED48iIBUMID0bIPNcMZHnjX1a/PoHI5sBMaMGtk8yiKalYfrlrv2Oe532pb9d8v9EopQprBK8cwPXpZgK/Coht57OKlza4cJarDLUdTDGbcNMPpYxZRoCvsiicTpAVSq7awtzi7lD0uxvPpnVwLPqmwcZyosnV8QwS78OsEdpg73QUvPz8L6ziTVsGofHtKtktzY+8ExktuE+gRRazKe1LKmyPCYseFyH4yR5oQapJcW+ZuQlFPgMftGbfNLtAw/bjJ7grnwLJFP0fhKa0e4M+by+J06Dy5ODLvf7fmOCn6YLPCbI0etZRpgIu5G8qYtwCa/nvq5ZmakHL0/qAYDEJe82yWrTIwXocRAN7F5mZpnlriEV0bRgomlgc5AQs2wpxPwldvcdWyoQH51XomJIGl7TNWW17WgUDriEwhV71uqDHioKo4sGheky9sex/tJ4Vb33jcQttenM8Z+D/zYbvOEIjTkQgYGMo2qN9axFaZLlGkbLiOOUhaiBL+Lb+1f0ZByLGCPLE21vTZIvqFo5tOZAbFRilmd82v0M9/vH+XrlJsbB8sOOmz6iUHjksewy7Ymm2xHev9erz5suitJrbzAUYXeooPhUjTaoq2XucU25Q85gl7JIaPfJ1l1ql4CZD9fnK2+L9Z7ubbcRPLpprgikjkms2k14dLECQK7e4OpippV8iwU92/v3dNxn7MzwsvHPGKWQ2W0soIx9z3oIz02DXrEZjwPN4g+Dx94AwKp8+LWt2V/aMH43/SwH4ZSiWEGzrbYkogGwJA468RqvJ2toicFbtbV7GXKsgMuSKcH+N6qjtUtMKWzgLdgbWKZ3e5muryVLLDR36rv49fDjNKnIZxD6Ik93TxiUyG0oTJTKFPZ619YfQ+SxHj/5xo6mOt9nfOwaq5I85y+Nei18GGytGSF2ZESPkOz8cCWpVHqpv95MzC+mSMOoocwq6a0r6Q7kCfAUjS5BoOkJ0jekF8hPzgs/OiatzeFlKPqq+ROjEKCLbMoTkFlUMaiMSYvXgLzysdoyHBlwuAk4ZXNiLytLZmJOxPUv6a0XyRreOQ7JYAx52bp7TGdmyPHjIOPVA6QlTdxOzyBexgHFCmT5nDOUNUMN0mlY3mx2P7ZpjRZ2NcODgyAIJgL8mJA96GmYKB1aoQTspm6ZFh8r/GI1H921P25fN3ZTBiOfvZBomBk03rZBeQq9PovHAufuojmq1rPXPOdNzw9MSSTTtJt8a9BQWJBZTzZ9EgoU8uDpQyRCZC1Lsyw0TaDQjrYk6NSCVbAUU3j3Wu4wND2FIr2NeiMb46zi3rjwkKfOOMecrKNLTXvs5u69Tr2z1xHKyZTCZF5B7NkHQPJl6rLVDlloXvPqetI6jrsWVyqzt4UYkY7kAgT5y/B4Zy8pWlAsU1/3bZ2aPEyGBuur1eKz7zndrT5OR0/4UrArPAMsJCmHudSuNSK2fkGUL0d2p/Jv+rU1J6dKGGPzc51OjZ4JbOAweGrkrgkGqVhYivrEw60j2TBEauWOxmcu+TEyPLMe6BL8PKQQp2gxYMeVq0gF4t0kbEq94mbqKlog/0FkCIKpQPOfrKZkbMyTTcwpI4+9fw1q95SWDe1nu31sOfKuSl1KTMQGFfrs4+7x1nEXreCC15Gbs5gRWKML1xtuPt/JimvJ+Cs74YqCaCf2vVcUx9rCyNuVBSiHzvCaDz2aj+Qmrm27BrA049kIEJv7ERIbU+tTBKZleibkvuNI40lTJEFhse+BHbGCewoODjMl9dAmgVRPvpY9rGOfvdX8DMQwQDsvWA9kdC8uFyDzp3AxgRfFtDWU/MEXArRdSA+yMPFABIGa3Kdw21g2ODj487ryjnotmTJ1ZMSLRbeu32tJtH+rirMmTehA8/3LZHlOTBVcUET36jA/J8pa0vnVtRhvY+zCmjvWSYKHPp33wZYH+QUnijaEd9JxRTtvfUeGNv7tYdYziXll3qWgqQMEgK6Eb6bTcb6x7iI+r8vEwTHiNm63wDpbHV+0/HWPC2G25mreMV885+IQazgZuM90VEGzfqIaEQPF7VauqmQ/zjs+aZ2pbBhjOmVoP3RNOi5AbqtPGSO42jeTRpa3nCTC29C2h2N3rFfBSdwWxuVP46oSNAjZGRBu22rVul6X1rRsMh+XdgUnFMIshgXC7ogwVWgt2ADOy6xJg4EmW9pPdgE/Bcj+FBHr3I5qNkzgvXcsVV9K/LA=';

class ChirpPage extends StatefulWidget {
  @override
  _ChirpPageState createState() => _ChirpPageState();
}

class _ChirpPageState extends State<ChirpPage> {
  ChirpState _chirpState = ChirpState.not_created;
  String _chirpErrors = '';
  String _chirpVersion = 'Unknown';
  Uint8List _chirpData = Uint8List(0);

  Future<void> _initChirp() async {
    await ChirpSDK.init(_appKey, _appSecret);
  }

  Future<void> _configureChirp() async {
    await ChirpSDK.setConfig(_appConfig);
  }

  Future<void> _sendChirp(String message) async {
    var payload = new Uint8List.fromList(message.codeUnits);
    await ChirpSDK.send(payload);
  }

  Future<void> _startAudioProcessing() async {
    await ChirpSDK.start();
  }

  Future<void> _stopAudioProcessing() async {
    await ChirpSDK.stop();
  }

  Future<void> _getChirpVersion() async {
    final String chirpVersion = await ChirpSDK.version;
    setState(() {
      _chirpVersion = chirpVersion;
    });
  }

  Future<void> _setChirpCallbacks() async {
    ChirpSDK.onStateChanged.listen((e) {
      setState(() {
        _chirpState = e.current;
      });
    });
    ChirpSDK.onSending.listen((e) {
      setState(() {
        _chirpData = e.payload;
      });
    });
    ChirpSDK.onSent.listen((e) {
      setState(() {
        _chirpData = e.payload;
        print(String.fromCharCodes(e.payload));
        messages.add(String.fromCharCodes(_chirpData));
      });
    });
    ChirpSDK.onReceived.listen((e) {
      setState(() {
        _chirpData = e.payload;
        print(String.fromCharCodes(e.payload));
        messages.add(String.fromCharCodes(e.payload));
      });
    });
    ChirpSDK.onError.listen((e) {
      setState(() {
        _chirpErrors = e.message;
        print(e.message);
      });
    });
  }

  Future<void> _requestPermissions() async {
    bool permission =
        await SimplePermissions.checkPermission(Permission.RecordAudio);
    if (!permission) {
      await SimplePermissions.requestPermission(Permission.RecordAudio);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _initChirp();
    _configureChirp();
    _getChirpVersion();
    _setChirpCallbacks();
    _startAudioProcessing();
  }

  @override
  void dispose() {
    _stopAudioProcessing();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _stopAudioProcessing();
    } else if (state == AppLifecycleState.resumed) {
      _startAudioProcessing();
    }
  }

  final TextEditingController chatEditingController = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Critical Messaging',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Flexible(
              child: messages.length == 0
                  ? Center(child: Text('Listening for Messages...'))
                  : ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        String message = messages[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Material(
                            elevation: 0,
                            child: Container(
                                child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  
                                  child: Text(
                                    'C',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                    ),
                                    Text(
                                      message,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
                        );
                      },
                    ),
            ),
            Container(
                height: 100.0,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                        controller: chatEditingController,
                        decoration: InputDecoration(
                            hintText: 'Send a message',
                            border: OutlineInputBorder(
                              
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                          onTap: () async {
                            await _sendChirp(chatEditingController.text);
                            chatEditingController.clear();
                          },
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
