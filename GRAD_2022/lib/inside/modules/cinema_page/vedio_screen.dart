import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/ss.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trailer'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller))
                    : Container(),
                Positioned(
                  bottom: 2,
                  width: MediaQuery.of(context).size.width,
                  child: _controller.value.isInitialized
                      ? VCaption(_controller)
                      : Container(),
                ),
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: VideoProgressIndicator(
                      _controller,
                      allowScrubbing: false,
                      colors: VideoProgressColors(
                          backgroundColor: Colors.blueGrey,
                          bufferedColor: Colors.blueGrey,
                          playedColor: Colors.blueAccent),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        fixedSize: MaterialStateProperty.all(Size(70, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    onPressed: () {
                      _controller.pause();
                    },
                    child: Icon(Icons.pause)),
                Padding(padding: EdgeInsets.all(2)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(80, 80)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    onPressed: () {
                      _controller.play();
                    },
                    child: Icon(Icons.play_arrow)),
                Padding(padding: EdgeInsets.all(2)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        fixedSize: MaterialStateProperty.all(Size(70, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    onPressed: () {
                      _controller.seekTo(Duration(
                          seconds: _controller.value.position.inSeconds + 10));
                    },
                    child: Icon(Icons.fast_forward)),
              ],
            )
          ],
        ));
  }
}

class VCaption extends StatefulWidget {
  const VCaption(
    this.videoPlayerController,
  );
  final VideoPlayerController videoPlayerController;
  @override
  _VCaptionState createState() => _VCaptionState();
}

class _VCaptionState extends State<VCaption> {
  String? selectedCaption = "";
  Map<int, String> captions = {5: "First subtitle", 20: "Second subtitle"};

  @override
  void initState() {
    widget.videoPlayerController.addListener(() {
      if (widget.videoPlayerController.value.isPlaying) {
        print("Time ${widget.videoPlayerController.value.position.inSeconds}");
        setState(() {
          if (captions.containsKey(
              widget.videoPlayerController.value.position.inSeconds)) {
            selectedCaption =
                captions[widget.videoPlayerController.value.position.inSeconds];
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClosedCaption(
      text: selectedCaption,
      textStyle: TextStyle(fontSize: 15, color: Colors.white),
    );
  }
}
