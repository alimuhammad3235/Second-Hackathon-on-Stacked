import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

dpcust(String typeof) {
  return Container(
    width: 400,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      typeof,
      style: const TextStyle(fontFamily: 'Pacifico', fontSize: 30),
    ),
  );
}

showSimpleModalDialog(context, texttt, casess) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                            text: "ReQuest Review",
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 30,
                                color: Colors.blueGrey),
                          )),
                    ),
                    Text(
                      "Name:  $texttt",
                      style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 22,
                          color: Colors.black),
                    ),
                    Text(
                      "Case:  $casess",
                      style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        "Phone No",
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      subtitle: const Text(
                        "+92099090909022",
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          final Uri url =
                              Uri(scheme: 'tel', path: "+92099090909022");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print('cannot launch this url');
                          }
                        },
                        child: const Icon(
                          Icons.call,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Done",
                                style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    fontSize: 18,
                                    color: Colors.black),
                              )),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      });
}
