import 'package:anotherjsonproject/model/comment_model.dart';
import 'package:anotherjsonproject/services/comment_services.dart';
import 'package:flutter/material.dart';
class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  CommentServices commentServices = CommentServices();
  late Future<List<Comment>> futurePosts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePosts = commentServices.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Comment>>(future: futurePosts, builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if (!snapshot.hasData||snapshot.data!.isEmpty){
          return const Center(child: Text("No data"),);
        }else if(snapshot.hasError){
          return  Center(child: Text("${snapshot.error}"));
        }else {
          return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context,index){
            Comment comment = snapshot.data![index];
            return ListTile(title: Text(comment.email),subtitle: Text(comment.body),);
            return null;
            });
          //

        }
      }),
    );
  }
}
