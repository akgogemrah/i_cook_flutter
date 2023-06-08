import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_do_cook/Model/RecipeModel.dart';
import 'package:provider/provider.dart';

class DropdownCategory extends StatefulWidget {
  const DropdownCategory({super.key});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}
 List<String> list = <String>[
  'category',
  'Chicken',
  'Vegeterian',
  'Meat',
  'Fish',
  'Fast-Food',
  'Dessert',
   'Gluten-free',
   'Pasta'
];

class _DropdownCategoryState extends State<DropdownCategory> {
  int findIndex(List<String> list, String element) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == element) {
        return i;
      }
    }
    return -1; // Eğer element listede bulunamazsa -1 döndürülür.
  }
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {


        setState(() {
          dropdownValue = value!;
print(findIndex(list, dropdownValue));

          int categoryIndex = (findIndex(list, dropdownValue));

          switch (categoryIndex) {
            case 0:
              Provider.of<RecipeModel>(context,listen: false).category='category';
              break;
            case 1:
              Provider.of<RecipeModel>(context,listen: false).category='Chicken';
              break;
            case 2:
              Provider.of<RecipeModel>(context,listen: false).category='Vegeterian';
              break;
            case 3:
              Provider.of<RecipeModel>(context,listen: false).category='Meat';
              break;
            case 4:
              Provider.of<RecipeModel>(context,listen: false).category='Fish';
              break;
            case 5:
              Provider.of<RecipeModel>(context,listen: false).category='Fast-Food';
              break;
            case 6:
              Provider.of<RecipeModel>(context,listen: false).category='Dessert';
              break;
            case 7:
              Provider.of<RecipeModel>(context,listen: false).category='Gluten-free';
              break;
            case 8:
              Provider.of<RecipeModel>(context,listen: false).category='Pasta';
              break;

            default:
              Provider.of<RecipeModel>(context,listen: false).category='category';
              break;
          }

        }

        );
      },

      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),

        );
      }).toList(),
    );
  }
}
