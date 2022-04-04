class ViewDataScreenModel{
  int id = 0;
  String title = '';
  String body = '';

  ViewDataScreenModel({
    required this.id,
    required this.title,
    required this.body,
  });

  ViewDataScreenModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'body':body,
    };
  }

}