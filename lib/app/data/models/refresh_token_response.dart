class RefreshTokenResponse {
  final String scope;
  final String accessToken;
  final num expiresIn;
  final num refreshExpiresIn;
  final String refreshToken;
  final String tokenType;
  final String sessionState;

  RefreshTokenResponse({
    required this.scope,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.sessionState,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => RefreshTokenResponse(
        scope: json['scope'] as String,
        accessToken: json['accessToken'] as String,
        expiresIn: json['expiresIn'] as num,
        refreshExpiresIn: json['refreshExpiresIn'] as num,
        refreshToken: json['refreshToken'] as String,
        tokenType: json['tokenType'] as String,
        sessionState: json['sessionState'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'scope': this.scope,
        'accessToken': this.accessToken,
        'expiresIn': this.expiresIn,
        'refreshExpiresIn': this.refreshExpiresIn,
        'refreshToken': this.refreshToken,
        'tokenType': this.tokenType,
        'sessionState': this.sessionState,
      };
}
