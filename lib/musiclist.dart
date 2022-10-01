import 'package:flutter/material.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  // ignore: non_constant_identifier_names
  List Songs = [
    {
      'name': 'Challa',
      'Path': 'songs/Challa.mp3',
      'movie': 'Jab Tak Hai jaan',
      'thumbnail': 'https://i.ytimg.com/vi/9a4izd3Rvdw/hqdefault.jpg'
    },
    {
      'name': 'Heer',
      'thumbnail': 'https://i.ytimg.com/vi/aNcxgxHcGYg/maxresdefault.jpg',
      'Path': 'songs/Heer.mp3',
      'movie': 'Jab Tak Hai jaan',
    },
    {
      'name': 'Jiya re jiya.mp3',
      'thumbnail':
          "https://www.pensivly.com/wp-content/uploads/2020/10/Jiya-Re-Full-Song-Jab-Tak-Hai-Jaan-1024x576.jpg",
      'Path': 'songs/Jiya re jiya.mp3',
      'movie': 'Jab Tak Hai jaan',
    },
    {
      'name': 'Kaise Mujse',
      'thumbnail': 'https://i.ytimg.com/vi/6d_z8RAyekk/maxresdefault.jpg',
      'Path': 'songs/Kaise Mujse.mp3',
      'movie': 'Ghajini',
    },
    {
      'name': 'Saans.mp3',
      'thumbnail':
          'https://i.pinimg.com/originals/41/8d/4b/418d4b2626e48d0467e89068aaee5c21.jpg',
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
      'name': 'Tera hone laga hu.mp3',
      'thumbnail':
          'https://th.bing.com/th/id/OIP.jHmSa61ctHYBfeco2HlOKQHaEK?pid=ImgDet&rs=1',
      'Path': 'songs/Tera hone laga hu.mp3',
      'movie': 'Ajaab Prem ki gajab kahani',
    },
    {
      'name': 'Tumhe dil lage.mp3',
      'thumbnail':
          'https://images.newsx.com/wp-content/uploads/2016/06/tumhe-dillagi-featuring-huma-and-Vidyut-768x432.jpg',
      'Path': 'songs/Tumhe dil lage.mp3',
      'movie': 'Albumb',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MusicLists"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: Songs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      Songs[index]['thumbnail'],
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Songs[index]['name'],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          Songs[index]['movie'],
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/player',
                              arguments: {'index': index});
                        },
                        icon: const Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
