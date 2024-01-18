import 'package:chat_app/screens/demo/list_view_demo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewDemo extends ConsumerStatefulWidget {
  const ListViewDemo({super.key});

  @override
  ConsumerState<ListViewDemo> createState() => _ListViewState();
}

class _ListViewState extends ConsumerState<ListViewDemo> {
  late ListViewDemoViewModel viewModel;
  late ScrollController scrollController;

  @override
  void initState() {
    viewModel = ListViewDemoViewModel(context: context, setState: setState);
    scrollController = ScrollController();
    scrollController.addListener(hideKeyboard);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Example'),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              toolbarHeight: 0,
              automaticallyImplyLeading:false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://via.placeholder.com/500x200', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // _buildasd(),

          ];
        },
        body: _buildRecommendedList(),
      ),
      // body: _buildRecommendedList(),
    );
  }

  Widget _buildasd() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _PinnedHeaderDelegate(
        child: _buildInputField('Email', Icons.email, viewModel.email),
      ),
    );
  }

  Widget _buildInputField(
      String hintText,
      IconData icon,
      TextEditingController controller
      ) {
    return Container(
      // height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff57636C)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(12.0), // 设置圆角
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    // Implement your refreshing logic here
  }

  ///推薦-列表
  Widget _buildRecommendedList() {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: SingleChildScrollView(
        controller: scrollController,
        // child: _buildList(),
        child: Column(
          children: [
            _buildInputField('Email', Icons.email, viewModel.email),
            _buildList(),
          ],
        ),
      ),
    );

    // return TopBottomPullLoader(
    //   onRefresh: () {
    //     print('onRefresh');
    //     // HapticFeedback.vibrate();
    //     HapticFeedback.lightImpact();
    //   },
    //   onFetchMore: () => print('onFetchMore'),
    //   child: _buildList(),
    // );
  }

  Widget _buildList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.list),
          trailing: const Text(
            "GFG",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
          title: Text("List item $index"),
        );
      },
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _PinnedHeaderDelegate({required this.child});

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: child,
    );
  }

  @override
  bool shouldRebuild(_PinnedHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
