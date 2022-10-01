import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  // ignore: non_constant_identifier_names
  List Songs = [
    {'name': 'Challa', 'Path': 'songs/Challa.mp3', 'movie': 'Jab Tak Hai jaan', 'thumbnail': 'https://i.ytimg.com/vi/9a4izd3Rvdw/hqdefault.jpg'},
    {
      'name': 'Heer',
      'thumbnail': 'https://i.ytimg.com/vi/aNcxgxHcGYg/maxresdefault.jpg',
      'Path': 'songs/Heer.mp3',
      'movie': 'Jab Tak Hai jaan',
    },
    {
      'name': 'Jiya_re_jiya.mp3',
      'thumbnail': "https://www.pensivly.com/wp-content/uploads/2020/10/Jiya-Re-Full-Song-Jab-Tak-Hai-Jaan-1024x576.jpg",
      'Path': 'songs/Jiya_re_jiya.mp3',
      'movie': 'Jab Tak Hai jaan',
    },
    {
      'name': 'Kaise_Mujse',
      'thumbnail': 'https://i.ytimg.com/vi/6d_z8RAyekk/maxresdefault.jpg',
      'Path': 'songs/Kaise_Mujse.mp3',
      'movie': 'Ghajini',
    },
    {
      'name': 'Saans.mp3',
      'thumbnail': 'https://i.pinimg.com/originals/41/8d/4b/418d4b2626e48d0467e89068aaee5c21.jpg',
      'Path': 'songs/Saans.mp3',
      'movie': 'Jab Tak Hai jaan',
    },
    {
      'name': 'Kesariya',
      'thumbnail': 'https://i.ytimg.com/vi/k_FMQtf1YqY/hqdefault.jpg',
      'Path': 'songs/Kesariya.mp3',
      'movie': 'Bramastra',
    },
    {
      'name': 'Tera_hone_laga_hu.mp3',
      'thumbnail': 'https://th.bing.com/th/id/OIP.jHmSa61ctHYBfeco2HlOKQHaEK?pid=ImgDet&rs=1',
      'Path': 'songs/Tera_hone_laga_hu.mp3',
      'movie': 'Ajaab Prem ki gajab kahani',
    },
    {
      'name': 'Tumhe_dil_lage.mp3',
      'thumbnail': 'https://images.newsx.com/wp-content/uploads/2016/06/tumhe-dillagi-featuring-huma-and-Vidyut-768x432.jpg',
      'Path': 'songs/Tumhe_dil_lage.mp3',
      'movie': 'Albumb',
    }
  ];
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final routes = ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    var i = routes['index']?.toInt();
    return Scaffold(
      appBar: AppBar(title: const Text("Player")),
      body: Container(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.fromLTRB(12, 5, 12, 5), child: Image.network(Songs[i ?? 0]['thumbnail'])),
            Slider(value: position.inSeconds.toDouble(), min: 0, max: duration.inSeconds.toDouble(), onChanged: (value) async {}),
            CircleAvatar(
              child: IconButton(
                  onPressed: () async {
                    if (isPlaying == false) {
                      await audioPlayer.play(AssetSource(Songs[i ?? 0]['Path']));
                    } else {
                      await audioPlayer.pause();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
            )
          ],
        ),
      ),
    );
  }
}
