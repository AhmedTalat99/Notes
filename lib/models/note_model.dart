import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0) // typeId must be unique ,over compeletly project
class NoteModel extends HiveObject{ //  HiveObject provides some features si,delete method
@HiveField(0)// index must be unique over class only,and can use the same index in other class
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
  final String date;// i made date String because if i made it DateTime ,should make typeAdapter,and register it
  @HiveField(3)
   int color; // i made color int because if i made it Color ,should make typeAdapter,and register it

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
