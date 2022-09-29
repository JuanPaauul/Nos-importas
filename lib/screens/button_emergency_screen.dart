import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/models/reqres_model.dart';

Future<ReqResRespuesta> getUsuarios() async {
  final resp = await http.get(Uri.parse('https://reqres.in/api/users'));
  return reqResRespuestaFromJson(resp.body);
}

class PanicPage extends StatefulWidget {
  const PanicPage({super.key});
  @override
  State<PanicPage> createState() => _MiPagina1State();
}

class _MiPagina1State extends State<PanicPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Emergencias $currentPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  textStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  '! BOTON DE PANICO !',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: BarraNavegacion(),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const Center(
        child: Text('BOTÓN DE EMERGENCIA'),
      ),
    );
  }
}

class PanicPageSetting extends StatelessWidget {
  const PanicPageSetting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
      ),
      body: FutureBuilder(
        future: getUsuarios(),
        builder:
            (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _ListaUsuarios(snapshot.data!.data);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const BotonFlotante(),
      bottomNavigationBar: BarraNavegacion(),
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;

  const _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int i) {
          final usuario = usuarios[i];

          return FadeIn(
            delay: Duration(milliseconds: 200 * i),
            child: ListTile(
              title: Text('${usuario.firstName} ${usuario.lastName}'),
              subtitle: Text(usuario.email),
              trailing: Image.network(usuario.avatar),
            ),
          );
        });
  }
}

class BarraNavegacion extends StatelessWidget {
  int currentPage = 0;

  BarraNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;

          //setState(() {});
        },
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: ('Camara')),
          const BottomNavigationBarItem(
              icon: Icon(Icons.security_sharp), label: ('Ajustes'))
        ]);
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 176, 121, 39),
        elevation: 0,
        highlightElevation: 0,
        child: const Icon(Icons.warning_amber),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const PanicPageSetting()));
        });
  }
}
