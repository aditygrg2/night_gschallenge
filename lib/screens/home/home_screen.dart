import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/new_update.dart';
import 'package:night_gschallenge/widgets/reusable_card.dart';
import '../../widgets/calm_tune_card_list.dart';
import '../mysleep/my_sleep_screen.dart';
import '../../navigators/drawer.dart';
import '../../navigators/bottomNavigator.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  final calmData= {'title':'Calm Tunes','tunes':[],'buttonLink':'/Home'};
  final recents= {'title':'Recents Added','tunes':[],'buttonLink':'/Home'};
  final newsData = {'title':'News Update','news':['a','b','c'],'buttonLink':'/Home'};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            ReusableCard(calmData),
            SizedBox(
              height: 2,
            ),
            Container(
              child: NewsUpdate(newsData),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 2,
            ),
            ReusableCard(recents),
          ],
        ),
      ),
    );
  }
}
