// ignore_for_file: library_private_types_in_public_api, must_be_immutable, non_constant_identifier_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/main.dart';
import 'package:nos_importas/models/reqres_model.dart';
import 'package:nos_importas/screens/utils.dart';

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
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Button(),
    const Police(),
    const Sms(),
    const Whatss(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        selectedFontSize: 20.0,
        unselectedFontSize: 15.0,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_on), label: ('Boton')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_police), label: ('Policia')),
          BottomNavigationBarItem(icon: Icon(Icons.sms), label: ('SMS')),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatsapp), label: ('WhatsApp')),
        ],
      ),
      floatingActionButton: const BotonFlotante(),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

// Boton visual para llamar a 110 \\
void EmergencyButton() {}

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
        backgroundColor: Colors.pink,
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
      //bottomNavigationBar: const BarraNavegacion(),
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

// Vista de Boton \\
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  textStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  backgroundColor: Colors.red),
              child: ElevatedButton.icon(
                onPressed: EmergencyButton,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    backgroundColor: Colors.yellow),
                label: const Text(
                  'EMERGENCIA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
                icon: const Icon(
                  Icons.warning,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                //setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Vista de Policia \\
class Police extends StatefulWidget {
  const Police({Key? key}) : super(key: key);

  @override
  State<Police> createState() => _PoliceState();
}

class _PoliceState extends State<Police> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                text: 'Region Cochabamba',
                onClicked: () => Utils.openLink(
                    url:
                        'https://wiconnect.iadb.org/osc/gestion-estrategica-comando-departamental-de-policia-cochabamba/'),
              ),
              buildButton(
                text: 'Radio Patrullas',
                onClicked: () => Utils.openLink(
                    url: 'https://www.facebook.com/PoliciaBolivianaCochabamba'),
              ),
            ],
          ),
        ),
      );
}

// Vista de Mensajes \\
class Sms extends StatelessWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HOLA MUNDO de mensajes.'),
    );
  }
}

// Vista de Whattsapp \\
class Whatss extends StatelessWidget {
  const Whatss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HOLA MUNDO de whattsapp.'),
    );
  }
}

// Links \\
Widget buildButton({
  required String text,
  required VoidCallback onClicked,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        onPressed: onClicked,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );

// Para contactos extraidos de un HTTP \\
class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 117, 176, 39),
        elevation: 0,
        highlightElevation: 0,
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const PanicPageSetting()));
        });
  }
}
