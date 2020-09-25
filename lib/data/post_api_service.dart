import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class PostApiService extends ChopperService {
//  @Get()
//  Future<Response> getPosts();

  @Get(path: '/{IFSC}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<Response> getPost(@Path('IFSC') String IFSC);

  static PostApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://ifsc.razorpay.com',
      services: [
        // The generated implementation
        _$PostApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PostApiService(client);
  }

}