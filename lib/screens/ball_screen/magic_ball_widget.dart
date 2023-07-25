import 'package:surf_practice_magic_ball/screens/ball_screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:text_to_speech/text_to_speech.dart';

class _BubbleCircle extends StatefulWidget {
  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<_BubbleCircle>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late ShakeDetector detector;

  final String defaultLanguage = 'en-US';
  TextToSpeech tts = TextToSpeech();
  double volume = 1;
  double rate = 0.8;
  double pitch = 1.0;

  @override
  void initState() {
    super.initState();
    // Basic loop animation of bubble.
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 320.0, end: 350.0).animate(controller);
    controller.repeat(reverse: true);
    // Shake init.
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        Future.delayed(Duration.zero, () {
          final model = context.watch<MagicBallViewModel>();
          model.getAnswer(context);
        });
      });
    });
  }

  void speak(String text) {
    tts.setVolume(volume);
    tts.setLanguage(defaultLanguage);
    tts.setRate(rate);
    tts.setPitch(pitch);
    tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MagicBallViewModel>();
    if (model.answer != "" && model.audioStatus) {
      speak(model.answer);
    }
    return GestureDetector(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return SizedBox(
              width: animation.value,
              height: animation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      model.loading
                          ? const Color.fromARGB(95, 110, 110, 110)
                          : model.errored
                              ? const Color.fromARGB(255, 255, 115, 105)
                              : Colors.blue,
                      BlendMode.modulate,
                    ),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/planet.png",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      model.answer,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  )
                ],
              ),
            );
          }),
      onTap: () {
        if (!model.loading) {
          model.getAnswer(context);
        }
      },
    );
  }

  @override
  void dispose() {
    // Release resources.
    controller.dispose();
    detector.stopListening();
    super.dispose();
  }
}

class MagicBallWidget extends StatelessWidget {
  const MagicBallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magic App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: _BubbleCircle(),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Нажмите на шар\nили потрясите телефоном",
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
