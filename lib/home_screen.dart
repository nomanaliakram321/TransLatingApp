import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learning_app/flag_button.dart';
import 'package:toast/toast.dart';
import 'package:translator/translator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();

  String inputText = '';
  bool _loading = false;
  List<String> _translatedTexts = [];
  List<String> _languagesCode = [
    'ur',
    // 'ru',
    'ar',
    'zh-cn',
    // 'hi',
    // 'de',
    // 'it',
    // 'es',
    // 'ur'
  ];
  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.7);
    await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    await flutterTts.speak(text);
  }


  Future translate() async {
    List<String> translatedTexts = [];
    setState(() {
      _loading = true;
    });
    for (String code in _languagesCode) {
      Translation translation = await translator.translate(inputText, to: code);
      String translatedText = translation.text;
      translatedTexts.add(translatedText);
    }
    setState(() {
      _translatedTexts = translatedTexts;
      _loading = false;
      print(_translatedTexts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning App'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(color: Colors.indigo[900]),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(10),
                hintText: 'Enter Text....',

                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
                filled: true,

                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.translate,
                  color: Colors.indigo[900],
                ),
                suffixIcon: _loading
                    ? Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.indigo[900]),
                        ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.indigo[900],
                        ),
                        onPressed: () {
                          if (inputText.isNotEmpty) {
                            translate();
                          }
                        },
                      ),
              ),
              onChanged: (value) {
                inputText = value;
              },
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                FlagButton(
                  country: 'Pakistan',
                  language: 'Urdu',
                  text: _translatedTexts.isEmpty
                      ? 'Please Write Something'
                      : _translatedTexts[0],
                  flag: 'pakistan.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ur-PK', _translatedTexts[0]);
                  },
                ),
                FlagButton(
                  country: 'Sudia Arabia',
                  language: 'Arabic',
                  text: _translatedTexts.isEmpty
                      ? 'Please Write Something'
                      : _translatedTexts[1],
                  flag: 'sudia.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ar-SA', _translatedTexts[1]);
                  },
                ),
                FlagButton(
                  country: 'China',
                  language: 'Chinese',
                  text: _translatedTexts.isEmpty
                      ? 'Please Write Something'
                      : _translatedTexts[2],
                  flag: 'china.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('zh-CN', _translatedTexts[2]);
                  },
                ),

                // FlagButton(
                //   text: _translatedTexts.isEmpty
                //       ? 'Russian'
                //       : _translatedTexts[1],
                //   flag: 'russia.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('ru-RU', _translatedTexts[1]);
                //   },
                // ),
                // FlagButton(
                //   text:
                //   _translatedTexts.isEmpty ? 'French' : _translatedTexts[2],
                //   flag: 'france.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('ar-SA', _translatedTexts[2]);
                //   },
                // ),
                // FlagButton(
                //   text: _translatedTexts.isEmpty
                //       ? 'Chinese'
                //       : _translatedTexts[3],
                //   flag: 'china.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('zh-CN', _translatedTexts[3]);
                //   },
                // ),
                // FlagButton(
                //   text:
                //   _translatedTexts.isEmpty ? 'Hindi' : _translatedTexts[4],
                //   flag: 'india.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('hi-IN', _translatedTexts[4]);
                //   },
                // ),
                // FlagButton(
                //   text:
                //   _translatedTexts.isEmpty ? 'German' : _translatedTexts[5],
                //   flag: 'germany.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('de-DE', _translatedTexts[5]);
                //   },
                // ),
                // FlagButton(
                //   text: _translatedTexts.isEmpty
                //       ? 'Italian'
                //       : _translatedTexts[6],
                //   flag: 'italy.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('it-IT', _translatedTexts[6]);
                //   },
                // ),
                // FlagButton(
                //   text: _translatedTexts.isEmpty
                //       ? 'Spanish'
                //       : _translatedTexts[7],
                //   flag: 'spain.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('es-ES', _translatedTexts[7]);
                //   },
                // ),
                // FlagButton(
                //   text: _translatedTexts.isEmpty
                //       ? 'Japanese'
                //       : _translatedTexts[8],
                //   flag: 'japan.png',
                //   onTap: () {
                //     if (_translatedTexts.isNotEmpty)
                //       speak('ur-PK', _translatedTexts[8]);
                //   },
                // ),
              ],
            ))
          ],
        ),
      ),
    );
  }


}
