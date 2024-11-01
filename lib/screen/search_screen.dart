import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping/models/search_model.dart';
import 'package:shopping/views/details/all_details.dart';
import 'package:shopping/views/details/search_detail.dart';
import 'package:shopping/views/login/login_page.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TextEditingController _searchController = TextEditingController();

  final Dio _dio = Dio();

  List<SearchModel> _searchModel = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData({String? search}) async {
    String url =
        "http://localhost:8000/api/item/searchNew?searchTerm=${search}";
    var res = await _dio.get(url);

    List<SearchModel> searchModel = [];
    if (res.data != null) {
      for (var p in res.data) {
        searchModel.add(SearchModel.fromJson(p));
      }
    }
    setState(() {
      _searchModel = searchModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }

    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox.expand(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchBar(),
              _productListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        controller: _searchController,
        onSubmitted: (value) {
          _loadData(search: value);
        },
        decoration: InputDecoration(
          hintText: "Search...",
          suffixIcon: IconButton(
              onPressed: () {
                _loadData(search: _searchController.text);
              },
              icon: Icon(Icons.search)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    );
  }

  Widget _productListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        itemCount: _searchModel.length,
        itemBuilder: (context, index) {
          final post = _searchModel[index];
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SearchDetail(all: post));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(post.imageUrl),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    post.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "               ${post.price} \$",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    child: Image.asset('assets/profile/hm.png'),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "         ${post.dealerName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
