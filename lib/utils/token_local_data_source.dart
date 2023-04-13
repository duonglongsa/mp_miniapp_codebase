
import 'package:shared_preferences/shared_preferences.dart';

/// {@template token_local_data_source}
/// AuthLocalDataSource interface
/// {@endtemplate}
abstract class ITokenLocalDataSource {
  /// get access token from memory or secure storage
  Future<String?> getAccessToken();

  /// get refresh token from memory or secure storage
  Future<String?> getRefreshToken();

  /// cache access token
  Future<void> cacheAccessToken({required String token});

  /// cache refresh token
  Future<void> cacheRefreshToken({required String token});

  /// Remove access token
  Future<void> removeAccessToken();

  /// Remove refresh token
  Future<void> removeRefreshToken();
}

/// {@template token_local_data_source}
/// [ITokenLocalDataSource] implementation using [FlutterSecureStorage]
/// {@endtemplate}
class SharedPreferencesTokenLocalDataSource implements ITokenLocalDataSource {
  /// {@macro SecureStorageAuthLocalDataSource}

  final _kAccessToken = 'ACCESS_TOKEN';
  final _kRefreshToken = 'REFRESH_TOKEN';
  final _kFirstRun = 'TOKEN_FIRST_RUN';

  String? _accessToken;
  String? _refreshToken;
  bool? _firstRun;

  Future<void> _setFirstRun() async {
    final firstRun = await _getFirstRun();
    if (firstRun == null) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(_kFirstRun, false);
      _firstRun = false;
    }
  }

  Future<bool?> _getFirstRun() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return _firstRun ??= sharedPrefs.getBool(_kFirstRun);
  }

  @override
  Future<bool> cacheAccessToken({required String token}) async {
    _accessToken = token;
    final sharedPrefs = await SharedPreferences.getInstance();
    final res = await sharedPrefs.setString(_kAccessToken, token);
    return res;
  }

  @override
  Future<bool> cacheRefreshToken({required String token}) async {
    _refreshToken = token;
    await _setFirstRun();
    final sharedPrefs = await SharedPreferences.getInstance();
    final res = await sharedPrefs.setString(_kRefreshToken, token);
    return res;
  }

  @override
  Future<String?> getAccessToken() async {
    if (_accessToken != null) {
      return _accessToken;
    }

    final firstRun = await _getFirstRun();

    if (firstRun == null) {
      return null;
    }
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(_kAccessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    if (_refreshToken != null) {
      return _refreshToken;
    }

    final firstRun = await _getFirstRun();

    if (firstRun == null) {
      return null;
    }
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(_kRefreshToken);
  }

  @override
  Future<bool> removeAccessToken() async {
    _accessToken = null;
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.remove(_kAccessToken);
  }

  @override
  Future<bool> removeRefreshToken() async {
    _refreshToken = null;
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.remove(_kRefreshToken);
  }
}
