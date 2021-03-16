import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/screens/tabs/profile_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/upload_screen.dart';
import 'package:sweaterz_flutter/view/constants.dart';
import 'following_feed_screen.dart';
import 'home_feed_screen.dart';
import 'local_feed_screen.dart';

class HomeRoot extends StatefulWidget {
  @override
  _HomeRootState createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.98),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: kGreyColor1_999999,
          selectedFontSize: 13.0,
          unselectedFontSize: 13.0,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Container(
                  // height: 20.0,
                  // width: 20.0,
                  child: Icon(
                    Icons.home,
                    //size: 20.0,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.home),
              ),
              label: 'Following',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              label: 'Local',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
      ),
    );
  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    //여기서 WidgetBuilder는 (context){return HomePage()}
    return {
      // 결국 return { '/' : (context){return HomePage()} }
      '/': (context) {
        return [
          HomeFeedScreen(),
          FollowingFeedScreen(onNext: _next), //이렇게 하면 bottomnBar 없이 넘어감!!!!
          UploadScreen(),
          LocalFeedScreen(),
          ProfileScreen(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    // { '/' : (context){return HomePage()} }

    return Offstage(
      offstage: _selectedIndex !=
          index, //index와 _selectedIndex가 다르면 안보이게. (주의 : 애니메이션은 offstage여부와 관계없이 계속 실행.)
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
            // routeSetting.name returns '/' as we have not specified any initialRoute.
          );
        },
      ),
    );
  }
}
