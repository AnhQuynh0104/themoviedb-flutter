class Account{
  String? name, username, avatarPath;

  Account({ this.name, this.username, this.avatarPath });

  Account.fromJson(Map<String, dynamic> json):
        this.name = json['name'],
        this.username = json['username'],
        this.avatarPath = json['avatarPath'];
}