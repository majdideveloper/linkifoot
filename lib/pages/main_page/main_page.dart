import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkifoot/features/post/presentation/pages/home_page.dart';
import 'package:linkifoot/features/user/presentation/cubit/get_single_user/get_single_user_cubit.dart';
import 'package:linkifoot/features/user/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  final String uid;

  const MainPage({super.key, required this.uid});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, state) {
        if (state is GetSingleUserLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetSingleUserFailure) {
          return Scaffold(
            body: Center(
              child: Text('Failed to load user: ${state}'),
            ),
          );
        }

        if (state is GetSingleUserLoaded) {
          final currentUser = state.user;
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,
                        color: Theme.of(context).colorScheme.primary),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search,
                        color: Theme.of(context).colorScheme.primary),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add,
                        color: Theme.of(context).colorScheme.primary),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,
                        color: Theme.of(context).colorScheme.primary),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined,
                        color: Theme.of(context).colorScheme.primary),
                    label: ""),
              ],
              onTap: navigationTapped,
            ),
            body: PageView(
              controller: pageController,
              children: [
                HomePage(),
                HomePage(),
                // SearchPage(),
                // UploadPostPage(currentUser: currentUser),
                // ActivityPage(),
                ProfilePage(currentUser: currentUser),
                HomePage(),
                ProfilePage(currentUser: currentUser),
              ],
              onPageChanged: onPageChanged,
            ),
          );
        }

        return const Scaffold(
          body: Center(child: Text('Unexpected state')),
        );
      },
    );
  }
}
