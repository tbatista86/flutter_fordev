import 'package:faker/faker.dart';
import 'package:fordev/domain/helpers/helpers.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/domain/entities/entities.dart';
import 'package:fordev/domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCaheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCacheStorage.saveSecure(
          key: 'token', value: account.token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}

abstract class SaveSecureCaheStorage {
  Future<void> saveSecure({@required String key, @required String value});
}

class SaveSecureCaheStorageSpy extends Mock implements SaveSecureCaheStorage {}

void main() {
  LocalSaveCurrentAccount sut;
  SaveSecureCaheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCaheStorageSpy();
    sut =
        LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    account = AccountEntity(faker.guid.guid());
  });

  test('Should call SaveSecureCaheStorage with correct values', () async {
    await sut.save(account);

    verify(
        saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw Unexpected error if SaveSecureCaheStorage throws',
      () async {
    when(saveSecureCacheStorage.saveSecure(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());

    final future = sut.save(account);
    expect(future, throwsA(DomainError.unexpected));
  });
}
