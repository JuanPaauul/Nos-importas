import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/models/reqres_model.dart';
import 'package:nos_importas/screens/user_form_screen.dart';

Future<ReqResRespuesta> getUsuarios() async {
  final resp = await http.get(Uri.parse('https://reqres.in/api/users'));
  return reqResRespuestaFromJson(resp.body);
}

class UserList extends StatefulWidget {
  const UserList({super.key});
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: getUsuarios(),
          builder:
              (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _UserDates(snapshot.data!.data);
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const BotonFlotante());
  }
}

class _UserDates extends StatelessWidget {
  final List<Usuario> usuarios;

  const _UserDates(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int i) {
          final usuario = usuarios[i];

          return FadeIn(
            delay: Duration(milliseconds: 150 * i),
            child: ListTile(
                onTap: () {},
                onLongPress: () {
                  _deleteContact(context, usuario);
                },
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(usuario.avatar)),
                trailing: const Icon(Icons.delete_outline),
                title: Text('${usuario.firstName} ${usuario.lastName}'),
                subtitle: Text(usuario.email)),
          );
        });
  }
}

_deleteContact(context, Usuario usuario) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: const Text('Eliminar usuario'),
            content: const Text('¿Seguro que quiere eliminar usuario?'),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              FloatingActionButton(
                  onPressed: () {
                    print(usuario.firstName);
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.red,
                  child: const Text('Borrar',
                      style: TextStyle(color: Colors.white)))
            ],
          ));
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 39, 135, 224),
        elevation: 0,
        highlightElevation: 0,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const UserForm()));
        });
  }
}
