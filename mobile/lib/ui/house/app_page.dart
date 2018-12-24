import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inkino/assets.dart';
import 'package:inkino/message_provider.dart';
import 'package:inkino/ui/house/share_page.dart';
import 'package:inkino/ui/house/vendor_page.dart';
import 'package:inkino/ui/house/vendor_seach_page.dart';
import 'package:inkino/ui/inkino_bottom_bar.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
 TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget _buildTabContent() {
    return Positioned.fill(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
         VendorPage(),
          VendorSeachPage(),
          SharePage()
        ],
      ),
    );
  }

  void _tabSelected(int newIndex) {
    setState(() {
      _selectedTab = newIndex;
      _tabController.index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImage = Image.asset(
      ImageAssets.backgroundImage,
      fit: BoxFit.cover,
    );

    final content = Scaffold(
      body: 
       Stack(
        children: [
          _buildTabContent(),
          _AppBottomTabs(
            selectedTab: _selectedTab,
            onTap: _tabSelected,
          ),
        ],
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        backgroundImage,
        content,
      ],
    );
  }
}

class _AppBottomTabs extends StatelessWidget {
  _AppBottomTabs({
    @required this.selectedTab,
    @required this.onTap,
  });

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final messages = MessageProvider.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkinoBottomBar(
        currentIndex: selectedTab,
        onTap: onTap,
        items: [         
          BottomNavigationBarItem(
            icon: Container(height: 83, child: Image.asset(ImageAssets.buttomNavVendor,fit: BoxFit.fill,)),
          ),
          BottomNavigationBarItem(
            icon: Container(height: 83, child: Image.asset(ImageAssets.buttomNavSeach,fit: BoxFit.fill,)),
          ),
          BottomNavigationBarItem(
            icon: Container(height: 83, width: 200, child: Image.asset(ImageAssets.buttomNavShare,fit: BoxFit.fill,)),
          ),
        ],
      ),
    );
  }
}