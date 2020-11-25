import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/domain/helpers/helpers.dart';
import 'package:fordev/domain/entities/entities.dart';

import 'package:fordev/data/cache/cache.dart';
import 'package:fordev/data/usecases/usecases.dart';

class SaveSecureCaheStorageSpy extends Mock implements SaveSecureCaheStorage {}

void main() {
  LocalSaveCurrentAccount sut;
  SaveSecureCaheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCaheStorageSpy();
    sut =
        LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    account = AccountEntity(token: faker.guid.guid());
  });

  void mockError() {
    when(saveSecureCacheStorage.saveSecure(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
  }

  test('Should call SaveSecureCaheStorage with correct values', () async {
    await sut.save(account);

    verify(
        saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw Unexpected error if SaveSecureCaheStorage throws',
      () async {
    mockError();

    final future = sut.save(account);
    expect(future, throwsA(DomainError.unexpected));
  });
}
