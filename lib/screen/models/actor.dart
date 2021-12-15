class Actor{
  String? name, profile_path, character;

  Actor({ this.name, this.profile_path, this.character });

  Actor.fromJson(Map<String, dynamic> json) : this.name = json['name'],
                                              this.profile_path = json['profile_path'],
                                              this.character = json['character'];
}