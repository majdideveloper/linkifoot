import 'package:linkifoot/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? username;
  final String? name;
  final String? bio;
  final String? website;
  final String? email;
  final String? profileUrl;
  final List? followers;
  final List? following;
  final num? totalFollowers;
  final num? totalFollowing;
  final num? totalPosts;

  UserModel({
    this.uid,
    this.username,
    this.name,
    this.bio,
    this.website,
    this.email,
    this.profileUrl,
    this.followers,
    this.following,
    this.totalFollowers,
    this.totalFollowing,
    this.totalPosts,
  }) : super(
          uid: uid,
          totalFollowing: totalFollowing,
          followers: followers,
          totalFollowers: totalFollowers,
          username: username,
          profileUrl: profileUrl,
          website: website,
          following: following,
          bio: bio,
          name: name,
          email: email,
          totalPosts: totalPosts,
        );

  /// 🔁 Factory for Supabase response
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] as String?,
      email: data['email'] as String?,
      name: data['name'] as String?,
      bio: data['bio'] as String?,
      username: data['username'] as String?,
      website: data['website'] as String?,
      profileUrl: data['profileUrl'] as String?,
      totalFollowers: data['totalFollowers'] as num?,
      totalFollowing: data['totalFollowing'] as num?,
      totalPosts: data['totalPosts'] as num?,
      followers: List.from(data['followers'] ?? []),
      following: List.from(data['following'] ?? []),
    );
  }
  static UserModel fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      username: user.username,
      name: user.name,
      bio: user.bio,
      website: user.website,
      profileUrl: user.profileUrl,
      followers: user.followers ?? [],
      following: user.following ?? [],
      totalFollowers: user.totalFollowers ?? 0,
      totalFollowing: user.totalFollowing ?? 0,
      totalPosts: user.totalPosts ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "username": username,
        "totalFollowers": totalFollowers,
        "totalFollowing": totalFollowing,
        "totalPosts": totalPosts,
        "website": website,
        "bio": bio,
        "profileUrl": profileUrl,
        "followers": followers,
        "following": following,
      };

  /// ✨ Add this: copyWith
  UserModel copyWith({
    String? uid,
    String? username,
    String? name,
    String? bio,
    String? website,
    String? email,
    String? profileUrl,
    List? followers,
    List? following,
    num? totalFollowers,
    num? totalFollowing,
    num? totalPosts,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      website: website ?? this.website,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      totalFollowers: totalFollowers ?? this.totalFollowers,
      totalFollowing: totalFollowing ?? this.totalFollowing,
      totalPosts: totalPosts ?? this.totalPosts,
    );
  }
}
