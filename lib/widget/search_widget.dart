import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/provider/search_provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String queries = '';
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: ( context, data,  child) {
       return  Container(
          height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
                leading: const Icon(
                  Icons.search,
                  size: 20,
                ),
                title: TextField(
                  controller: _controller,
                  onChanged: (String value) {
                    setState(() {
                      queries = value;
                    });

                      data.getRestaurantSearch(value);

                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      hintText: "Find your favorite restaurant ?",
                      border: InputBorder.none),
                ),
                trailing: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    if (queries != '') {
                      _controller.clear();
                      setState(() {
                        queries = '';
                      });
                    }
                  },
                  icon: const Icon(Icons.close,
                      size: 20),
                )));
      },
    );
  }
}
