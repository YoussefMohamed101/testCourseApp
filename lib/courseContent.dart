import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ContentData {
  final name;
  final numbOfLec;
  final duration;
  final lecList;
  final selectionName;

  ContentData({
    this.name,
    this.numbOfLec,
    this.duration,
    this.lecList,
    this.selectionName,
  });
}

class CourseContent extends StatefulWidget {
  const CourseContent({Key? key}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {

  String selectedTab = 'Description';
  String selectedContent = 'Null';

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  FlickManager? flickManager;


  //VideoPlayerController? _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.asset(
    //   'assets/video.mp4',
    // )..addListener(() {setState(() {
    //
    // });})..setLooping(true);
    //
    // _initializeVideoPlayerFuture = _controller.initialize().then((value) => _controller.play());
    //
    // // _initializeVideoPlayerFuture = _controller.initialize();


    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..addListener(() {setState(() {
      
    });
    })..initialize().then((value) => _controller.play());

    flickManager = FlickManager(
      autoPlay: true,
      videoPlayerController: _controller,
    );



  }

  @override
  void dispose() {
    // // Ensure disposing of the VideoPlayerController to free up resources.

    _controller.dispose();

    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<ContentData> contentDataDetails = [
      ContentData(
        name: "01.Introduction",
        numbOfLec: "3 Lectures",
        duration: "7 min",
        lecList: [
          {
            'name': 'Setting up individual Camera Rigs',
            'duration': '00:44',
          },
          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '03:49',
          },
          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '02:20',
          },
        ],
        selectionName: 'Intro',
      ),
      ContentData(
        name: "02.Movement In VR",
        numbOfLec: "3 Lectures",
        duration: "7 min",
        lecList: [
          {
            'name': 'Setting up individual Camera Rigs',
            'duration': '00:44',
          },
          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '03:49',
          },
          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '02:20',
          },
        ],
        selectionName: "Movement",
      ),
      ContentData(
        name: "03.Distance Grabber",
        numbOfLec: "3 Lectures",
        duration: "7 min",
        lecList: [
          {
            'name': 'Setting up individual Camera Rigs',
            'duration': '00:44',
          },
          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '02:20',
          },
        ],
        selectionName: "Distance",
      ),
      ContentData(
        name: "04.Snap Zones",
        numbOfLec: "3 Lectures",
        duration: "7 min",
        lecList: [

          {
            'name': 'Setting up VRTXs Tracked Alias',
            'duration': '02:20',
          },
        ],
        selectionName: "Snap",
      ),
    ];

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Butterfly Video'),
    //   ),
    //   body: Column(
    //     children: [
    //       Stack(
    //         alignment: Alignment.center,
    //         children: [
    //           GestureDetector(
    //             onTap: (){
    //               setState(() {
    //                 showPlayPauseButton = !showPlayPauseButton;
    //                 print(showPlayPauseButton);
    //               });
    //             },
    //             child: FutureBuilder(
    //               future: _initializeVideoPlayerFuture,
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState == ConnectionState.done) {
    //                   // If the VideoPlayerController has finished initialization, use
    //                   // the data it provides to limit the aspect ratio of the video.
    //                   return AspectRatio(
    //                     aspectRatio: _controller.value.aspectRatio,
    //                     // Use the VideoPlayer widget to display the video.
    //                     child: VideoPlayer(_controller),
    //                   );
    //                 } else {
    //                   // If the VideoPlayerController is still initializing, show a
    //                   // loading spinner.
    //                   return const Center(
    //                     child: CircularProgressIndicator(),
    //                   );
    //                 }
    //               },
    //             ),
    //           ),
    //           Visibility(
    //             visible: showBlackBg,
    //             child: Positioned.fill(child: Container(
    //               color: Colors.black.withOpacity(0.4),
    //             ),),
    //           ),
    //           Visibility(
    //             visible: showPlayPauseButton,
    //             child: FloatingActionButton(
    //               onPressed: () {
    //                 // Wrap the play or pause in a call to `setState`. This ensures the
    //                 // correct icon is shown.
    //                 setState(() {
    //                   // If the video is playing, pause it.
    //                   if (_controller.value.isPlaying) {
    //                     _controller.pause();
    //                     showBlackBg = true;
    //                   } else {
    //                     // If the video is paused, play it.
    //                     _controller.play();
    //                     showBlackBg = false;
    //                   }
    //                 });
    //               },
    //               // Display the correct icon depending on the state of the player.
    //               child: Icon(
    //                 _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             left: 0,
    //             right: 0,
    //             child: VideoProgressIndicator(
    //               _controller,
    //               allowScrubbing: true,
    //               colors: VideoProgressColors(playedColor: Colors.black,bufferedColor: Colors.grey),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );



    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 40,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 35,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
            _controller!= null && _controller.value.isInitialized?
            AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: FlickVideoPlayer(
              flickVideoWithControls: FlickVideoWithControls(
                videoFit: BoxFit.fill,
                aspectRatioWhenLoading: _controller.value.aspectRatio,
                controls: FlickPortraitControls(),
              ),
              flickManager: flickManager!,
            ),
          ): Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context,index) => Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircularPercentIndicator(
                              animation: true,
                              animationDuration: 1200,
                              radius: 20.0,
                              lineWidth: 2.0,
                              percent: 0.78,
                              center: new Text("78%"),
                              progressColor: Colors.blue,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                            Expanded(
                              child: Text(
                                "${contentDataDetails[index].name}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("${contentDataDetails[index].numbOfLec}, ${contentDataDetails[index].duration}",style: TextStyle(fontSize: 12),),
                          ],
                        ),
                        if (selectedContent == contentDataDetails[index].selectionName)
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 18.0),
                            child: Column(
                              children: [
                                ListView.separated(
                                  itemBuilder: (context,index2) => GestureDetector(
                                    onTap: (){
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons
                                                .play_circle_outline,color: Colors.blue,),
                                            SizedBox(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.01,
                                            ),
                                            Expanded(
                                                child: Text(
                                                  "${contentDataDetails[index].lecList[index2]['name']}",
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                )),
                                            const Icon(
                                              Icons.lock_open_rounded,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0),
                                          child: Text(
                                            '${contentDataDetails[index].lecList[index2]['duration']}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  separatorBuilder: (context,index2) => SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  itemCount: contentDataDetails[index].lecList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    height:
                    MediaQuery.of(context).size.height * 0.06,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedContent != contentDataDetails[index].selectionName) {
                            selectedContent = contentDataDetails[index].selectionName;
                          } else {
                            selectedContent = 'null';
                          }
                          setState(() {});
                        });
                      },
                    ),
                  ),
                ],
              ),
              itemCount: contentDataDetails.length,
              separatorBuilder: (context,index) => SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Buy Course',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


