class UserDto {
  final int id;
  final String name;
  final String email;
  final String website;

  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    id:      json['id']      as int,
    name:    json['name']    as String,
    email:   json['email']   as String,
    website: json['website'] as String,
  );
}
