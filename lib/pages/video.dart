import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  List<String> _videoTitles = [    'Video 1',    'Video 2',    'Video 3',  ];
  List<String> _videoUrls = [    'https://www.youtube.com/watch?v=726-yVTff7E&ab_channel=NishantChahar',    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4',  ];

  int _selectedVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_videoUrls[_selectedVideoIndex]);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeVideo(int index) {
    setState(() {
      _selectedVideoIndex = index;
      _controller = VideoPlayerController.network(_videoUrls[_selectedVideoIndex]);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: 250.0,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            _videoTitles[_selectedVideoIndex],
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _videoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _changeVideo(index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: index == _selectedVideoIndex ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      _videoTitles[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
