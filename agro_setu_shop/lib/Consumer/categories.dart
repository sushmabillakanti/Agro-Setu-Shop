import 'package:agro_setu_shop/product.dart';
import 'package:flutter/material.dart';
import 'cart2.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.count(
        primary: false,
        mainAxisSpacing: 5,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ...List.generate(
            items.length,
                (index) => CategoryCard(
                  item: items[index],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required GroupItems this.item,
  }) : super(key: key);
  final GroupItems item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => FetchData(id: item.id)),);
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.18,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Image.asset(item.img),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
