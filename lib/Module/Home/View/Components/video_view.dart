import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoView extends StatefulWidget {
  final String? url;
  final Function(VideoPlayerController?) function;
  VideoView(this.url, this.function);
  @override
  VideoViewState createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    _controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _controller!.setLooping(true);
    _controller!.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    });
    widget.function.call(_controller);
    _controller!.play();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller = null;
    widget.function.call(null);
    super.dispose();
  }

  bool isIncreaseView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              if (_controller != null && _controller!.value.isPlaying) {
                _controller!.pause();
              } else {
                _controller!.play();
              }
            },
            child: _isInitialized
                ? Container(
                    child: Center(
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: _controller?.value != null &&
                                  _controller?.value.size != null &&
                                  _controller?.value.size.width != null &&
                                  _controller?.value.size.height != null &&
                                  (_controller!.value.size.width >=
                                          (_controller!.value.size.height) ||
                                      _controller?.value.size.height ==
                                          _controller?.value.size.width)
                              ? BoxFit.fitWidth
                              : BoxFit.cover,
                          child: SizedBox(
                            width: _controller?.value.size.width ?? 0,
                            height: _controller?.value.size.height ?? 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Center(
                                  child: VisibilityDetector(
                                    onVisibilityChanged: (VisibilityInfo info) {
                                      setState(() {
                                        _isVisible = info.visibleFraction > 0;
                                        if (!_isVisible) {
                                          _controller!.pause();
                                        }
                                      });
                                    },
                                    key: Key("1"),
                                    child: VideoPlayer(
                                      _controller!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      color: AppColor.white,
                      radius: 22,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
