import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DeviceInfoPage extends StatefulWidget {
  DeviceInfoPage({Key key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  List textWidgets = [];
  String data = "";
  String image = "";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    if (Platform.isAndroid) {
      androidInfo();
    } else if (Platform.isIOS) {
      iosInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Device Info"),
        backgroundColor: Colors.black,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Center(
      child: Card(
        elevation: 35,
        shadowColor: Colors.black,
        color: Colors.black,
        child: SizedBox(
          height: 750,
          width: 750,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 108,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Image(
                        image: NetworkImage(image),
                      ),
                      radius: 100,
                    ),
                  ),
                  ...textWidgets,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLine() {
    return textWidgets.add(Text(
      "----------------------------------------------------------------------",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ));
  }

  getAndroidInfo(String info) async {
    return textWidgets.add(Container(
        height: MediaQuery.of(context).size.height / 8,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "androidId: $info",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        )));
  }

  getIosInfo(String info) {
    textWidgets.add(Container(
        height: MediaQuery.of(context).size.height / 8,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "name: $info",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        )));
  }

  androidInfo() async {
    image =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Android_robot.svg/1200px-Android_robot.svg.png";

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    getLine();
    getAndroidInfo(androidInfo.androidId);
    getLine();
    getAndroidInfo(androidInfo.board);
    getLine();
    getAndroidInfo(androidInfo.bootloader);
    getLine();
    getAndroidInfo(androidInfo.brand);
    getLine();
    getAndroidInfo(androidInfo.device);
    getLine();
    getAndroidInfo(androidInfo.display);
    getLine();
    getAndroidInfo(androidInfo.fingerprint);
    getLine();
    getAndroidInfo(androidInfo.hardware);
    getLine();
    getAndroidInfo(androidInfo.hashCode.toString());
    getLine();
    getAndroidInfo(androidInfo.host);
    getLine();
    getAndroidInfo(androidInfo.id);
    getLine();
    getAndroidInfo(androidInfo.isPhysicalDevice.toString());
    getLine();
    getAndroidInfo(androidInfo.manufacturer);
    getLine();
    getAndroidInfo(androidInfo.model);
    getLine();
    getAndroidInfo(androidInfo.product);
    getLine();
  }

  iosInfo() async {
    image =
        "https://yt3.ggpht.com/ytc/AKedOLRHAs9Cabc57f-YDu1-DCaZzxx0mUlhDOtWc9LK_A=s900-c-k-c0x00ffffff-no-rj";
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    getLine();
    getIosInfo(iosInfo.name);
    getLine();
    getIosInfo(iosInfo.systemName);
    getLine();
    getIosInfo(iosInfo.systemVersion);
    getLine();
    getIosInfo(iosInfo.model);
    getLine();
    getIosInfo(iosInfo.localizedModel);
    getLine();
    getIosInfo(iosInfo.identifierForVendor);
    getLine();
    getIosInfo(iosInfo.isPhysicalDevice.toString());
    getLine();
    getIosInfo(iosInfo.utsname.sysname);
    getLine();
    getIosInfo(iosInfo.utsname.nodename);
    getLine();
    getIosInfo(iosInfo.utsname.release);
    getLine();
    getIosInfo(iosInfo.utsname.version);
    getLine();
    getIosInfo(iosInfo.utsname.machine);
    getLine();
  }
}
