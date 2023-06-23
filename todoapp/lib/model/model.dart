class TodoModel{
  final String name;
  bool iscompleted = false;
  TodoModel({
    required this.name,
    this.iscompleted = false,
  });

  @override
  String toString() => 'TodoModel(name : $name , iscompleted : $iscompleted)'; 
}