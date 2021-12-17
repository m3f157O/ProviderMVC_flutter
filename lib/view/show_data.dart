
import 'package:custom_polar_beat_ui_v2/controller/controller.dart';
import 'package:custom_polar_beat_ui_v2/model/model.dart';
import 'package:custom_polar_beat_ui_v2/view/exercise_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'graphs/fast_iso.dart';

//TODO NULL CHECK PROPERLY

class ShowData extends StatefulWidget {

  const ShowData({Key? key}) : super(key: key);


  @override
  RequestAndShow createState() => RequestAndShow();
}


class RequestAndShow extends State<ShowData> {

  bool newActivities=false;
  late List<Map<dynamic,dynamic>> savedActivities;
  late Map<dynamic,dynamic> msg3;

  final ScrollController _scrollController2 = ScrollController();

  void onItemTapped() {
    return;
  }


  @override
  void initState() {
    super.initState();

  }

  void addToDb(BuildContext context,String name) {
  Controller().addToDb(context,name);
  }

  @override
  Widget build(BuildContext context) {
    savedActivities = Provider.of<AppState>(context).savedActivities;
    newActivities = Provider.of<AppState>(context).newActivities;
    Color main=Provider.of<AppState>(context).main;
    Color second=Provider.of<AppState>(context).second;
    Color text=Provider.of<AppState>(context).text;
    var _controller = TextEditingController();

    return Scaffold(
      backgroundColor: main,
      body: Container(
        color: main,
        child: Stack(
          children: [





            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    LiquidPullToRefresh(
                      color: Colors.black54,
                      backgroundColor: Colors.black54,
                      springAnimationDurationInMilliseconds: 500,
                      showChildOpacityTransition: false,
                      onRefresh: () async {
                        setState(() {
                          Controller().refreshActivities(context);
                          Controller().statsRoutine(context);
                        });
                      },
                      child: Column(
                        children: [

                          Align(alignment: Alignment.topCenter,
                              child:   Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: second,
                                    gradient: LinearGradient(
                                        stops: [0,1],
                                        colors: [
                                          second,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter
                                    )
                                ),
                              )
                          ),
                          SizedBox(height: 20,),
                          newActivities ? Text("NEW ACTIVITIES, PLEASE PULL TO REFRESH",
                            style:  TextStyle(
                                color: second,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ) : Text(""),
                          SizedBox(
                            // color: Colors.red,
                            height: 300,

                            child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController2,
                                itemCount: savedActivities.length,
                                itemBuilder: (context, i) {
                                  if (i == savedActivities.length) {
                                    return  const CupertinoActivityIndicator();
                                  }
                                  return Bounceable(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetails(data: savedActivities.elementAt(i),color: main,second: second)));
                                    },
                                    child: Container(
                                      height: 80,
                                      width: double.infinity,
                                      padding:  EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      margin:  EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        color: second,
                                      ),
                                      child: Row(

                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           SizedBox(width: 5),









                                              Text(
                                                savedActivities.elementAt(i)['expiredate'].toString(),
                                                style:  TextStyle(
                                                    color: text,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Spacer(),
                                              Text(
                                                savedActivities.elementAt(i)['name'].toString(),
                                                style:  TextStyle(
                                                    color: text,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Spacer(),







                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 30,
                                margin:  EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      second,
                                      main,
                                    ]),

                                  )
                              ),

                            ),

                      SizedBox(
                        // color: Colors.red,
                        height: 300,

                          child :TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Insert into database',
                              suffixIcon: IconButton(
                                onPressed: () => addToDb(context,_controller.text),
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          )
                      ),


                        ],
                      )

                    ),
                  ]),
                ),

              ],
            ),

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



}





