import 'dart:async';

import 'package:custom_polar_beat_ui_v2/controller/net_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/extension.dart';

import 'model.dart';

//TODO SYNCHRONIZE PROPERLY


class DataBase {

    static late final Database _database;
    static const _databaseName = "/my_db";
    final NetController net=NetController();



    Future<bool> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath+_databaseName;
    _database = await openDatabase(path);



    var result =await _database.rawQuery("SELECT * FROM sqlite_master WHERE name='Dummy'");
    //this is to create tables on first start
    if(result.isEmpty) {

      createDummyTable();

    }



    return true;
  }

    void updateDummyTable(String name) async {
      Map<String,String> map={ "type":"misc","name":name, "expiredate":DateTime.now().toString() };
      await _database.insert("Dummy",map);
      print(name+" stored");

    }



    void dropDummyTable() async {
      _database.execute('DROP TABLE Dummy');
    }


     Future<bool> reset() async {

       synchronized(() async {
         dropDummyTable();
       });
       synchronized(() async {
         createDummyTable();
       });


      return true;

    }



    void createDummyTable() async {
      _database.execute(
          'CREATE TABLE Dummy (type TEXT, name TEXT, expiredate TEXT)');
    }



    Future<String> fetchTable() async {

      List<Map> list = await _database.rawQuery("SELECT * FROM Dummy");

      if(list.isEmpty) {
        return "";
      } else {

        return list.elementAt(0)["name"];
      }
    }













    Future<bool> fetchActivitiesBy(BuildContext context,String toOrder) async {


      List<Map> list = await _database.query('Dummy', orderBy: toOrder);

      if(list.isEmpty) {
        return false;
      } else {


        Provider.of<AppState>(context,listen: false).clearNewBuffer();

        Provider.of<AppState>(context,listen: false).setActivities(list);

        return true;
      }


    }

    Future<bool> setStatistics(BuildContext context) async {


      List<Map> list = await _database.rawQuery(
          'select name from Dummy');
      if(list.elementAt(0)["name"]=="null") {
        Provider.of<AppState>(context,listen: false).setEntries(0);
        return false;
      } else {


        num wordCount=0;
        num charCount=0;
        for(int i=0;i<list.length;i++) {
          wordCount= wordCount+list.elementAt(i)["name"].toString().split(" ").length;
          charCount= charCount+list.elementAt(i)["name"].toString().length;
        }
        num lenght=list.length;
        Provider.of<AppState>(context,listen: false).setEntries(list.length);
        Provider.of<AppState>(context,listen: false).setChars(charCount);
        Provider.of<AppState>(context,listen: false).setWords(wordCount);
        Provider.of<AppState>(context,listen: false).setCharTuples(charCount/lenght);
        Provider.of<AppState>(context,listen: false).setWordTuples(wordCount/lenght);

        return true;
      }


    }






    }





