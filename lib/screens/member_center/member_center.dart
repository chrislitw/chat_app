import 'package:chat_app/screens/demo/list_view_demo.dart';
import 'package:chat_app/screens/demo/video_thumbnail_demo.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberCenter extends ConsumerStatefulWidget {
  const MemberCenter({super.key});

  @override
  ConsumerState<MemberCenter> createState() => _MemeberCenterState();
}

class _MemeberCenterState extends ConsumerState<MemberCenter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MemberCenter'),
        automaticallyImplyLeading: false,
        actions: [logoutButton()],
      ),
      body: _buildPlayground(),
    );
  }

  Widget _buildPlayground(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        children: [
          _buildBlockColor(Colors.greenAccent, 'ListView', ListViewDemo()),
          _buildBlockColor(Colors.greenAccent, 'video thumbnail', VideoThumbnailDemo()),
        ],
      ),
    );
  }

  Widget _buildBlockColor(Color color, String title,  Widget page) {
    return InkWell(
      onTap: () {
        BaseViewModel.pushPage(context, page);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: color,
        ),
        child: Center(
          child: FittedBox(
            child: Text(title),
          )
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          logout(context);
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
