import '../../../data/http/http.dart';
import '../../factories/factories.dart';
import '../../decorators/decorators.dart';

HttpClient makeAuthorizeHtppClientDecorator() => AuthorizeHttpClientDecorator(
    decoratee: makeHttpAdapter(),
    fetchSecureCacheStorage: makeLocalStorageAdapter());
