import 'package:clipboard/clipboard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FlagButton extends StatefulWidget {
  final String text;
  final String flag;
  final Function onTap;
  final String country;
  final String language;

  const FlagButton(
      {Key key, this.text, this.flag, this.onTap, this.language, this.country});


  @override
  _FlagButtonState createState() => _FlagButtonState();

}

class _FlagButtonState extends State<FlagButton> {
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: duration,
        gravity: gravity,
        backgroundColor: Colors.white,
        textColor: Colors.indigo[500]);
  }
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      speed: 1000,

      flipOnTouch: true,
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        height: 120,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.indigo),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100],
                blurRadius: 10,
                spreadRadius: 4,
              )
            ]),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/${widget.flag}',
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.country,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                    ),
                    Text(
                      'Language: ${widget.language}',
                      style: TextStyle(color: Colors.indigo[200]),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.indigo[100],
              height: 1,
              indent: 100,
              endIndent: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Click to Swap',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.indigo[200]),
                ),
              ],
            )
          ],
        ),
      ),

      back: Container(
        height: 175,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.indigo),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100],
                blurRadius: 10,
                spreadRadius: 4,
              )
            ]),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Text(
              'Translated Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
              ),
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.indigo),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo[100],
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ]),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                widget.text,
                maxLines: 4,
              ),
            ),

            // Row(
            //
            //
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Image.asset(
            //         'assets/$flag',
            //         height: 70,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     SizedBox(width: 20),
            //     Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(top: 10),
            //           child: Text(
            //             text,
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.indigo[900],
            //             ),
            //           ),
            //         ))
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.indigo),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo[100],
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.copy,
                        size: 25,
                        color: Colors.indigo[900],
                      ),
                      onPressed: () {
                        FlutterClipboard.copy(widget.text).then(
                                (value) => showToast(widget.text,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM));
                        // FlutterClipboard.copy('t.me/bestkrok').then((value) =>
                        //     showToast("t.me/bestkrok Copied",
                        //         duration: Toast.LENGTH_LONG,
                        //         gravity: Toast.BOTTOM));
                      },
                    )),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.indigo),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo[100],
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        size: 27,
                        color: Colors.indigo[900],
                      ),
                      onPressed: widget.onTap,
                    )),

                // Text('Click to Swap',textAlign: TextAlign.end,style: TextStyle(color: Colors.indigo[200]),),
              ],
            )
          ],
        ),
      ),
    );

    //   GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     color: Color(0xff263238),
    //     margin: EdgeInsets.all(10),
    //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //     child: Row(
    //       children: [
    //         Image.asset(
    //           'assets/$flag',
    //           width: 50,
    //         ),
    //         SizedBox(width: 20),
    //         Expanded(
    //             child: Text(
    //               text,
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 color: Colors.white,
    //               ),
    //             ))
    //       ],
    //     ),
    //   ),
    // );
  }
}
