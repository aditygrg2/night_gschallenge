import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/play_episode.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class PodcastScreenPlay extends StatelessWidget {
  // List<Map<dynamic, dynamic>> episodes = [
  //   {
  //     "number": "1",
  //     "title": "Sounds of the Earth - Brazilian Rainforest and Banjo Frogs",
  //     "description":
  //         "Relax with a calming mix of music and natural sounds, from the Atlantic rainforests of Brazil to Eastern Banjo Frogs in Adelaide, Australia...",
  //     "time": "8 min"
  //   },
  //   {
  //     "number": "2",
  //     "title": "Inside The Temple",
  //     "description":
  //         "There's a gentle rhythm to everyday life in a Hindu temple, that follows carefully choreographed rituals linked to the care of the deities...",
  //     "time": "8 min"
  //   },
  //   {
  //     "number": "3",
  //     "title": "Sounds of the Earth - Seychelles and Barbados",
  //     "description":
  //         "Relax with a calming mix of music and natural sounds, from birdsong and tortoises in the Seychelles to waves and whistling frogs in Barbados, via a bubbling brook in Northumberland and a murmuration...",
  //     "time": "8 min"
  //   },
  //   {
  //     "number": "4",
  //     "title": "The Glacier in Retreat",
  //     "description":
  //         "High in the mountains snow falls. As it comes to rest on the frozen slopes it become part of an ancient glacier. Over the course of 100 years the glacier will flow down the valley, changing the landscape around it...",
  //     "time": "8 min"
  //   },
  //   {
  //     "number": "5",
  //     "title": "A Sunday walk through Harlem",
  //     "description":
  //         "In the Upper Manhattan neighbourhood of Harlem all is quiet as people stay at home, preferring not to venture out into the minus-13-degree snow and ice that has blanketed the city...",
  //     "time": "8 min"
  //   },
  // ];
  static String routeName = '/podcast-play';
  @override
  Widget build(BuildContext context) {
    final podcast =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TopRow(
              back: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 80,
                        child: Image.network(
                          podcast['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width-128,
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            podcast['title'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width-128,
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            podcast['description'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text("All Episodes"),
            ),
            ...(podcast['episodes'] as List).map((e) {
              int index = (podcast['episodes'] as List)
                  .indexWhere((element) => element.toString() == e.toString());
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: PlayEpisode(
                  description: e['description'],
                  episodeName: e['title'],
                  index: index,
                  episodes: podcast['episodes'],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
