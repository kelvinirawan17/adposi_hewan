class Profile {
  final String name;
  final String username;
  final String email;

  Profile(this.name, this.email, this.username);

  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        username = json['username'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
