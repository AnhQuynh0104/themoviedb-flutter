class RequestToken{
  String? requestToken, expiresAt;
  bool? success;

  RequestToken({ this.requestToken, this.expiresAt, this.success });

  RequestToken.fromJson(Map<String, dynamic> json) : this.requestToken = json['requestToken'],
                                                      this.expiresAt = json['expiresAt'],
                                                      this.success = json['success'];
}