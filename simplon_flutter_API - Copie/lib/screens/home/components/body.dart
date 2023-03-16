import 'package:flutter/material.dart';
import 'package:myapp/models/BriefBundle.dart';
import 'package:myapp/size_config.dart';
import 'package:get_it/get_it.dart';
import '../../../models/api_response.dart';
import '../../../services/briefs_service.dart';
import 'categories.dart';
import 'brief_bundel_card.dart';


class Body extends StatefulWidget {
  @override
  _BriefListState createState() => _BriefListState();
}

class _BriefListState extends State<Body> {

  GetIt locator = GetIt.instance;
  // register BriefsService with GetIt
  @override
  void initState() {
    locator.registerLazySingleton(() => BriefsService());
    _fetchBriefs();
    super.initState();
  }

  BriefsService get service => locator<BriefsService>();

  late APIResponse<List<BriefBundle>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  /*@override
  void initState() {
    _fetchBriefs();
    super.initState();
  }*/

  _fetchBriefs() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getBriefsList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_apiResponse.error) {
      return Center(child: Text(_apiResponse.errorMessage?? 'error'));
    }

    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: _apiResponse.data?.length?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => BriefBundelCard(
                  briefBundle: _apiResponse.data?[index]?? BriefBundle(
                    id: 1,
                    title: "Brief New Everyday",
                    description: "New and challenge every minute",
                    imageSrc: "assets/images/cook_new@2x.png",
                    //color: Color(0xFFD82D40),
                  ),
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

