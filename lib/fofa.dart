import 'dart:io';
import 'dart:convert';

const String API = "fofa.info";
const String INFO = "/api/v1/info/my";
const String SEARCH = "/api/v1/search/all";
const String SEARCHSTATS = "/api/v1/search/stats";
const String HOSTSTATS = "/api/v1/host/";

class Fofa {
  String FoFaKey = "";
  String FoFaEmail = "";
  var _client = new HttpClient();

  Fofa(String FoFaKey, String FoFaEmail, {String MaxSize = "100"}) {
    this.FoFaKey = FoFaKey;
    this.FoFaEmail = FoFaEmail;
  }
  Future<Map> MyInfo() async {
    Map<String, dynamic> body = {"email": this.FoFaEmail, "key": this.FoFaKey};
    final uri = new Uri.https(API, INFO, body);
    var request = await this._client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != 200) {
      return {"error": "Please Check Your NetWork"};
    }
    var responseBody = await response.transform(utf8.decoder).join();
    Map result = jsonDecode(responseBody);
    if (result["error"]) {
      return {"error": result["error"]};
    } else {
      return result;
    }
  }

  Future<Map> SearchAll(String query,
      {String fields = "host,ip,port",
      int page = 1,
      bool full = false,
      int size = 100}) async {
    var query_encode = base64.encode(utf8.encode(query));
    Map<String, dynamic> body = {
      "qbase64": query_encode,
      "fields": fields,
      "page": page.toString(),
      "size": size.toString(),
      "full": full.toString(),
      "email": this.FoFaEmail, 
      "key": this.FoFaKey
    };
    final uri = new Uri.https(API, SEARCH, body);
    var request = await this._client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != 200) {
      return {"error": "Please Check Your NetWork"};
    }
    var responseBody = await response.transform(utf8.decoder).join();
    Map result = jsonDecode(responseBody);
    if (result["error"]) {
      return {"error": result["error"]};
    } else {
      return result;
    }
  }
  Future<Map> SearchStats(String query,{String fields=""})async{
    var query_encode = base64.encode(utf8.encode(query));
    Map<String, dynamic> body = {
      "qbase64": query_encode,
      "fields": fields,
      "email": this.FoFaEmail, 
      "key": this.FoFaKey
    };
    final uri = new Uri.https(API, SEARCH, body);
    var request = await this._client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != 200) {
      return {"error": "Please Check Your NetWork"};
    }
    var responseBody = await response.transform(utf8.decoder).join();
    Map result = jsonDecode(responseBody);
    if (result["error"]) {
      return {"error": result["error"]};
    } else {
      return result;
    }
  }
  Future<Map> HostDetail(String host,{bool detail=false})async{
    Map<String, dynamic> body = {
      "email": this.FoFaEmail, 
      "key": this.FoFaKey,
      "detail":detail.toString()
    };
    final uri = new Uri.https(API, HOSTSTATS+host, body);
    print(uri.toString());
    var request = await this._client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != 200) {
      return {"error": "Please Check Your NetWork"};
    }
    var responseBody = await response.transform(utf8.decoder).join();
    Map result = jsonDecode(responseBody);
    if (result["error"]) {
      return {"error": result["error"]};
    } else {
      return result;
    }
  }
}
