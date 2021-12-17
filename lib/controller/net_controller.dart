





class NetController {


  //TODO CALL THIS IF YOU WANT
  // CALL FROM CONTROLLER OR MODELDB FOR NETWORK CALLS. CAHNGE CAN BE PUSHED BY CHANGENOTIFIER IF NEEDER. INVOKE THE CONTROLLER TO MAKE THE CHANGE
  // most of API calls are hardcoded because expandability would be very low anyway
  late final String _token;
  late final String _id;
  void setToken(String value) {_token = value;}
  void setId(String value) {_id = value;}


/*
  Future<bool> registerUser(String token,String id) async {
    var response = await http.post(Uri.parse('https://www.polaraccesslink.com/v3/users'),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "token"
        },
        body:
        jsonEncode({"member-id": "id"})
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode.toString());
      print(response.contentLength);
      return false;
    }
  }
  */


}

