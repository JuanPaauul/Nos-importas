// ignore_for_file: avoid_print
import 'dart:ffi';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/models/reqres_model.dart';
import 'package:nos_importas/screens/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<ReqResRespuesta> getUsuarios() async {
  final resp = await http.get(Uri.parse('https://reqres.in/api/users'));
  return reqResRespuestaFromJson(resp.body);
}

class PanicPage extends StatefulWidget {
  const PanicPage({super.key});
  @override
  State<PanicPage> createState() => _MiPagina1State();
}

class _MiPagina1State extends State<PanicPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      'https://media.istockphoto.com/id/479391700/es/vector/sos.jpg?s=612x612&w=0&k=20&c=FbbGhKYJiKzV3AQxt7rhdCVNVEgtWRPgckgF7kG9y2Y=';
  List<String> miImages = [
    'https://media.istockphoto.com/id/479391700/es/vector/sos.jpg?s=612x612&w=0&k=20&c=FbbGhKYJiKzV3AQxt7rhdCVNVEgtWRPgckgF7kG9y2Y=',
    'https://seeklogo.com/images/P/policia-boliviana-logo-6D6E0297DB-seeklogo.com.jpg',
    'https://img.freepik.com/vector-premium/concepto-smishing-mensaje-electronico-capturado-hacker-uso-fraudulento-alerta-estafa_594511-423.jpg?w=2000',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQruaf7V267l99k548J8fIA3SjcBf8f73lllA&usqp=CAU'
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Colors.pink,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: Colors.pink,
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                  indicator: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(),
                      color: Colors.greenAccent),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  controller: tabController,
                  isScrollable: true,
                  tabs: const <Widget>[
                    Tab(icon: Icon(Icons.radio_button_on), text: 'Botón'),
                    Tab(icon: Icon(Icons.local_police), text: 'Seguridad'),
                    Tab(icon: Icon(Icons.sms), text: 'Mensajeria'),
                    Tab(icon: Icon(Icons.wifi), text: 'Red Social'),
                  ]),
            )),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 450.0,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: TabBarView(
              controller: tabController,
              children: const [
                Button(),
                Police(),
                Sms(),
                Whatss(),
              ],
            ),
          ),
        )),
      ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                      'EMERGENCIA',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 21,
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: const BotonFlotante(),
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: const BotonFlotante(),
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: const BotonFlotante(),
      );
}

// Vista de Whattsapp \\
class Whatss extends StatefulWidget {
  const Whatss({Key? key}) : super(key: key);

  @override
  State<Whatss> createState() => _WhatssState();
}

class _WhatssState extends State<Whatss> {
  void launchWhatsapp({@required phone, @required message}) async {
    String url = "https://wa.me/$phone/?text=${Uri.parse(message)}";

    await launchUrlString(url)
        ? launchUrlString(url)
        : print("No se pudo abrir Whatsapp");
  }

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
                    'Open WhatsApp',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.whatsapp,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Por defecto \\
                    launchWhatsapp(
                        phone: "77424313", message: "Alerta de Auxilio !!!");
                  },
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: const BotonFlotante(),
      );
}

// Para contactos extraidos de un HTTP \\
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
