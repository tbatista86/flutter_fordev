import 'package:meta/meta.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/data/http/http.dart';

class RemoteLoadSurveys {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSurveys({
    @required this.url,
    @required this.httpClient,
  });

  Future<void> load() async {
    await httpClient.request(url: url, method: 'get');
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  String url;
  HttpClientSpy httpClient;
  RemoteLoadSurveys sut;

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteLoadSurveys(url: url, httpClient: httpClient);
  });
  test('Should call HttpClient with correct calues', () async {
    await sut.load();

    verify(httpClient.request(url: url, method: 'get'));
  });
}