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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 50),
                    textStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    primary: Colors.red,
                    backgroundColor: Colors.red),
                child: ElevatedButton.icon(
                  onPressed: EmergencyButton,
                  style: TextButton.styleFrom(
                      primary: Colors.redAccent,
                      backgroundColor: Colors.yellow),
                  label: Text(
                    'EMERGENCIA',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.warning,
                    size: 70,
                    color: Colors.black,
                  ),
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

// manda un GMAIL \\
void EmergencyButton() {
  runApp(const ContactPage());
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

// LINK: https://www.emailjs.com/ \\
Future sendEmail() async {
  final url = Uri.parse("");
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact Form"),
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.account_circle),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.subject_rounded),
                    hintText: 'Subject',
                    labelText: 'Subject',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
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
        unselectedItemColor: Colors.white.withOpacity(1.0),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed), label: ('Gps')),
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
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const PanicPageSetting()));
        });
  }
}
