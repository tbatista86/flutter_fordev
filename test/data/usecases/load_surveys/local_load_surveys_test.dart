import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fordev/domain/entities/entities.dart';
import 'package:fordev/domain/helpers/helpers.dart';
import 'package:fordev/data/cache/cache.dart';
import 'package:fordev/data/usecases/usecases.dart';

class CacheStorageSpy extends Mock implements CacheStorage {}

void main() {
  group('load', () {
    CacheStorageSpy cacheStorage;
    LocalLoadSurveys sut;
    List<Map> data;

    List<Map> mockValidData() => [
          {
            'id': faker.guid.guid(),
            'question': faker.randomGenerator.string(10),
            'date': '2020-07-20T00:00:00Z',
            'didAnswer': 'false',
          },
          {
            'id': faker.guid.guid(),
            'question': faker.randomGenerator.string(10),
            'date': '2019-03-12T00:00:00Z',
            'didAnswer': 'true',
          }
        ];

    PostExpectation mockFetchCall() => when(cacheStorage.fetch(any));

    void mockFetch(List<Map> list) {
      data = list;
      mockFetchCall().thenAnswer((_) async => data);
    }

    void mockFetchError() => mockFetchCall().thenThrow(Exception());

    setUp(() {
      cacheStorage = CacheStorageSpy();
      sut = LocalLoadSurveys(cacheStorage: cacheStorage);
      mockFetch(mockValidData());
    });

    test('Should call cacheStorage with correct key', () async {
      await sut.load();

      verify(cacheStorage.fetch('surveys')).called(1);
    });

    test('Should return a list of surveys on success', () async {
      final surveys = await sut.load();

      expect(surveys, [
        SurveyEntity(
          id: data[0]['id'],
          question: data[0]['question'],
          dateTime: DateTime.utc(2020, 7, 20),
          didAnswer: false,
        ),
        SurveyEntity(
          id: data[1]['id'],
          question: data[1]['question'],
          dateTime: DateTime.utc(2019, 3, 12),
          didAnswer: true,
        ),
      ]);
    });

    test('Should throw UnexpectedError if cache is empty', () async {
      mockFetch([]);
      final future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw UnexpectedError if cache is null', () async {
      mockFetch(null);
      final future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw UnexpectedError if cache is invalid', () async {
      mockFetch([
        {
          'id': faker.guid.guid(),
          'question': faker.randomGenerator.string(10),
          'date': 'invalid date',
          'didAnswer': 'false',
        },
      ]);
      final future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw UnexpectedError if cache is incomplete', () async {
      mockFetch([
        {
          'date': '2020-07-20T00:00:00Z',
          'didAnswer': 'false',
        },
      ]);
      final future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });
    test('Should throw UnexpectedError if cache throws error', () async {
      mockFetchError();
      final future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });
  });

  group('validate', () {
    CacheStorageSpy cacheStorage;
    LocalLoadSurveys sut;
    List<Map> data;

    List<Map> mockValidData() => [
          {
            'id': faker.guid.guid(),
            'question': faker.randomGenerator.string(10),
            'date': '2020-07-20T00:00:00Z',
            'didAnswer': 'false',
          },
          {
            'id': faker.guid.guid(),
            'question': faker.randomGenerator.string(10),
            'date': '2019-03-12T00:00:00Z',
            'didAnswer': 'true',
          }
        ];

    PostExpectation mockFetchCall() => when(cacheStorage.fetch(any));

    void mockFetch(List<Map> list) {
      data = list;
      mockFetchCall().thenAnswer((_) async => data);
    }

    setUp(() {
      cacheStorage = CacheStorageSpy();
      sut = LocalLoadSurveys(cacheStorage: cacheStorage);
      mockFetch(mockValidData());
    });

    test('Should call cacheStorage with correct key', () async {
      await sut.validate();

      verify(cacheStorage.fetch('surveys')).called(1);
    });

    test('Should delete cache if its invalid', () async {
      mockFetch([
        {
          'id': faker.guid.guid(),
          'question': faker.randomGenerator.string(10),
          'date': 'inavalid date',
          'didAnswer': 'false',
        },
      ]);
      await sut.validate();

      verify(cacheStorage.delete('surveys')).called(1);
    });
  });
}
