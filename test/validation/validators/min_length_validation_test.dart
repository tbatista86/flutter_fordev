import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:fordev/validation/validators/validators.dart';
import 'package:fordev/presentation/protocols/protocols.dart';

void main() {
  MinLenghtValidation sut;

  setUp(() {
    sut = MinLenghtValidation(field: 'any_field', size: 5);
  });
  test('Should return error if value is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.invalidField);
  });

  test('Should return error if value is less min size', () {
    final ramdoGenerator = faker.randomGenerator.string(4, min: 1);
    expect(sut.validate({'any_field': ramdoGenerator}),
        ValidationError.invalidField);
  });

  test('Should return null if value is equal than min size', () {
    final ramdoGenerator = faker.randomGenerator.string(5, min: 5);
    expect(sut.validate({'any_field': ramdoGenerator}), null);
  });

  test('Should return null if value is bigger than min size', () {
    final ramdoGenerator = faker.randomGenerator.string(10, min: 6);
    expect(sut.validate({'any_field': ramdoGenerator}), null);
  });
}
