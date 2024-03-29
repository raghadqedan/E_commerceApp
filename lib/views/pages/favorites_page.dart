import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/views/widgets/prodect_item.dart';
import 'package:ecommerce_app/views/widgets/search_wedget.dart';
import 'package:flutter/material.dart';

import '../../models/favorite_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String selectedFiltter = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchWedget(title: 'Search Something',fillter: true,),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: FiltterFaveroitsItem.values
                      .map(
                        (filtter) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                if( selectedFiltter ==filtter.name)
                                      selectedFiltter='';
                                      else
                                      selectedFiltter = filtter.name;
                              }),
                              child: Text(filtter.name),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      filtter.name == selectedFiltter
                                          ? AppColors.white
                                          : null,
                                  backgroundColor:
                                      filtter.name == selectedFiltter
                                          ? AppColors.primary
                                          : AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.builder(
                itemCount: dummyFaveroits.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) =>
                    ProductItem(productItem: dummyFaveroits[index])))
          ],
        ),
      ),
    );
  }
}
