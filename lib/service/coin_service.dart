import 'package:basic_cubit/model/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinService {

  static Future<Coin?> getCoin(String urlData) async {
    var url = Uri.parse(urlData);

    var response = await http.get(url);
    print(response.body);
    return coinFromJson(response.body);
  }

}