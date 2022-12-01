// ignore_for_file: avoid_print
import 'dart:ffi';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/models/reqres_model.dart';
import 'package:nos_importas/screens/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        selectedFontSize: 22.0,
        unselectedFontSize: 17.0,
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
class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                child: ShinyButton(
                    color: Colors.red,
                    child: const Text(
                      'Emergencia',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      // Por defecto
                      Utils.openPhoneCall(phoneNumber: '110');
                    }),

                // Sector Rojo push \\
                onPressed: () {
                  // Por defecto
                  Utils.openPhoneCall(phoneNumber: '110');
                },
              ),
            ],
          ),
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
            children: <Widget>[
              TextButton(
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  label: const Text(
                    'Region Cochabamba',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.link,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Por defecto
                    Utils.openLink(url: 'https://www.policia.bo/');
                  },
                ),
                onPressed: () {},
              ),
              TextButton(
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  label: const Text(
                    'Radio Patrullas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.facebook,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Por defecto
                    Utils.openLink(
                        url:
                            'https://www.facebook.com/PoliciaBolivianaCochabamba');
                  },
                ),
                onPressed: () {},
              ),
              TextButton(
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  label: const Text(
                    'Canales',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.video_library,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Por defecto
                    Utils.openLink(
                        url: 'https://www.youtube.com/watch?v=SKne6Zo-Hd4');
                  },
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}

// Vista de Mensajes \\
class Sms extends StatefulWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  label: const Text(
                    'Open SMS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.keyboard,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Por defecto
                    Utils.openSMS(phoneNumber: '+4912388128311');
                  },
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}

// Vista de Whattsapp \\
class Whatss extends StatelessWidget {
  const Whatss({Key? key}) : super(key: key);

  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";

    // ignore: deprecated_member_use
    await canLaunch(url) ? launch(url) : print("No se pudo abrir Whatsapp");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Por defecto \\
              launchWhatsapp(
                  number: "+75460326", message: "Alerta de Auxilio !!!");
            },
            child: const Text("Open Whatsapp"),
          ),
        ),
      ),
    );
  }
}

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

//*****Boton Brillante*****

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  const ShinyButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.child});

  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2300));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            alignment: Alignment.center,
            child: widget.child,
            padding: const EdgeInsets.all(100),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  widget.color,
                  Colors.white,
                  widget.color,
                  widget.color,
                ],
                stops: [0.0, _controller.value, 1.0, -10.0],
              ),
            ),
          );
        });
  }
}
