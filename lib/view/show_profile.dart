import 'package:custom_polar_beat_ui_v2/model/model.dart';
import 'package:custom_polar_beat_ui_v2/view/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import 'graphs/fast_iso.dart';


class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {

  late List<Map<dynamic,dynamic>> topDistanceActivities;
  late List<Map<dynamic,dynamic>> topCaloriesActivities;
  late List<Map<dynamic,dynamic>> topDurationActivities;

  @override
  Widget build(BuildContext context) {

    num entries=Provider.of<AppState>(context).totalEntries;
    Color main=Provider.of<AppState>(context).main;
    Color second=Provider.of<AppState>(context).second;
    num words=Provider.of<AppState>(context).totalWords;
    num chars=Provider.of<AppState>(context).totalChars;
    num ct=Provider.of<AppState>(context).charTuples;
    num wt=Provider.of<AppState>(context).wordTuples;


    return Scaffold(
      backgroundColor: const Color(0xff121421),
      body: SafeArea(
        child: Stack(
          children: [


            Scaffold(
              backgroundColor: main,
                      body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          "Hello! ",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                            height: 300,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total Entries",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    entries.toString()+" tuples",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total Words",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    words.toString()+" words",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total Letters",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    chars.toString()+ " characters",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16,
                                      top: 16,
                                    ),
                                    child: Text(
                                      "Words/Tuples",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Text(
                                      wt.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                    ),
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16,
                                      top: 16,
                                    ),
                                     child: Text(
                                       "Letters/Tuples",
                                       style: TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w900,
                                         color: Colors.black45,
                                       ),
                                     ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Text(
                                      ct.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "LONGEST WORDS TUPLES",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "SHORTEST WORD TUPLES",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      /*  onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExerciseDetails(data: topCaloriesActivities.elementAt(i), color: main, second: second)));
                        },*/


                      ],
                    ),
                  ),
                ),
    ),
    ),
        //

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                        stops: const [0,1],
                        colors: [
                          second,
                          main
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    )
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }

  void onStartButtonPressed() {

  }


}