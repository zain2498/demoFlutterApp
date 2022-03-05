import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWhatsappDM extends StatefulWidget {
  const MyWhatsappDM({Key? key}) : super(key: key);

  @override
  _MyWhatsappDMState createState() => _MyWhatsappDMState();
}

class _MyWhatsappDMState extends State<MyWhatsappDM> {
  var phoneController = TextEditingController();
  var text = "";
  var textController = TextEditingController();
  var phone = "";

  bool _validate = false;

  @override
  void dispose() {
    phoneController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Whatsapp DMs'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Phone",
                    enabledBorder: OutlineInputBorder(),
                    errorText: _validate ? 'Enter phone Number' : null),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  onChanged: (value) {
                    text = value;
                  },
                  controller: textController,
                  decoration: InputDecoration(
                      hintText: "Message",
                      errorText: _validate ? 'Message can\'t be null' : null,
                      enabledBorder: OutlineInputBorder())),
              ElevatedButton(
                  onPressed: () async {
                    var url = 'https://wa.me/$phone?text=$text';
                    setState(() {
                      // textController.text.isEmpty ? _validate = true : _validate = false;
                    });
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  },
                  child: const Text("send"))
            ],
          ),
        ),
      ),
    );
  }
}
