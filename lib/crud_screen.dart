import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  /*call database and show user*/
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  /*add user*/
  void _addUser(){
    _users.add({
      'name': _nameController.text,
      'profession': _professionController.text
    });
    _nameController.clear();
    _professionController.clear();
  }

  /*user delete by left slide*/
  void _deleteUser(String userId)
  {
    _users.doc(userId).delete();
  }

  void _updateUser(String userId)
  {
    _users.doc(userId).update({
      'name': _nameController.text,
      'profession' : _professionController.text,
    });

    _nameController.clear();
    _professionController.clear();
  }

  /*edit user*/
  void _editUser(DocumentSnapshot user)
  {
    _nameController.text = user['name'];
    _professionController.text = user['profession'];

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "User Name"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _professionController,
              decoration: InputDecoration(
                  labelText: "User Proffesion"
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel"),),
          ElevatedButton(onPressed: (){_updateUser(user.id);Navigator.pop(context);}, child: const Text("Update"),),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _professionController,
              decoration: InputDecoration(
                labelText: 'Proffesion',
              ),
            ),
            ElevatedButton(onPressed: (){
              _addUser();
            }, child: const Text('Upload Data')),
            const SizedBox(height: 16,),
            Expanded(
              child: StreamBuilder(
                stream: _users.snapshots(),
                builder: (context, snapshot)
              {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    var user = snapshot.data!.docs[index];
                    return Dismissible(
                      key: Key(user.id),
                      background: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete, color: Colors.white,),
                      ),
                      onDismissed: (direction){
                        _deleteUser(user.id);
                      },
                      direction: DismissDirection.endToStart,
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text("Name: "+user['name']),
                          subtitle: Text("Profession: "+user['profession'],
                          style: TextStyle(color: Colors.grey[600]),),
                          trailing: Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: (){
                                  _editUser(user);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            ),
            ),
          ],
        ),
      ),
    );
  }
}
