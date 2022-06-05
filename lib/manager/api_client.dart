import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soccer_zone/models/SeasonsResponse.dart';
part 'api_client.g.dart';

String api_key = "aff0b3060fmsh341831e529ad917p1b0755jsnc95fe6726c71";

@RestApi(baseUrl: "https://elenasport-io1.p.rapidapi.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('v2/seasons')
  Future<SeasonsResponse> getAllSeasons(
      @Header("X-RapidAPI-Host") String appid,
      @Header("X-RapidAPI-Key") String apikey,
      @Query("page") int page,
      );



/*@POST('user/Api/v1/user/login')                                         //login
  Future<Response> getLogin([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @Header("Version") String version,
    @QueryMap() Map<String, String> param,
  ]);*/
}