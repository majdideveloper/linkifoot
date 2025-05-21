import 'package:linkifoot/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:linkifoot/features/user/data/models/user_model.dart';
import 'package:linkifoot/features/user/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserRemoteDataSource implements UserRemoteDataSource {
  final SupabaseClient supabase;

  SupabaseUserRemoteDataSource({required this.supabase});

  @override
  Future<void> createUser(UserEntity user) async {
    final userMap = UserModel.fromEntity(user).toJson();

    await supabase.from('users').insert(userMap);
  }

  @override
  Future<void> followUnFollowUser(UserEntity user) async {
    final client = Supabase.instance.client;
    final currentUid = Supabase.instance.client.auth.currentUser?.id;

    if (currentUid == null) return;

    final currentUserResponse =
        await client.from('users').select().eq('uid', currentUid).single();

    final targetUserResponse = await client
        .from('users')
        .select()
        .eq('uid', user.uid as String)
        .single();

    final currentFollowing =
        List<String>.from(currentUserResponse['following'] ?? []);
    final targetFollowers =
        List<String>.from(targetUserResponse['followers'] ?? []);

    final isFollowing = currentFollowing.contains(user.uid);

    if (isFollowing) {
      // Unfollow
      currentFollowing.remove(user.uid);
      targetFollowers.remove(currentUid);
    } else {
      // Follow
      currentFollowing.add(user.uid!);
      targetFollowers.add(currentUid);
    }

    await client.from('users').update({
      'following': currentFollowing,
      'total_following': currentFollowing.length,
    }).eq('uid', currentUid);

    await client.from('users').update({
      'followers': targetFollowers,
      'total_followers': targetFollowers.length,
    }).eq('uid', user.uid as String);
  }

  Future<String> getCurrentUid() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      return user.id;
    } else {
      throw Exception("No user signed in");
    }
  }

  @override
  Future<bool> isSignIn() async {
    return supabase.auth.currentSession != null;
  }

  @override
  Future<void> signInUser(UserEntity user) async {
    final response = await supabase.auth.signInWithPassword(
      email: user.email!,
      password: user.password!, // You need to add `password` to your UserEntity
    );

    if (response.user == null) {
      throw Exception("Failed to sign in user");
    }
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  @override
  Future<void> signUpUser(UserEntity user) async {
    final authResponse = await supabase.auth.signUp(
      email: user.email!,
      password: user.password!,
    );

    final supabaseUser = authResponse.user;
    if (supabaseUser == null) throw Exception("Failed to sign up user");

    final userModel = UserModel.fromEntity(user).copyWith(uid: supabaseUser.id);

    await supabase.from('users').insert(userModel.toJson());
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await supabase
        .from('users')
        .update(userModel.toJson())
        .eq('uid', user.uid as String);
  }
}
