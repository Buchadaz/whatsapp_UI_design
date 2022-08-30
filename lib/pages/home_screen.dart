import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //Divide a tela em abas! Sensacional!
        length: 4, // Quantidade de Abas que você deseja
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            actions: [
              //Começa do canto direito para esquerda
              const Icon(Icons.search),
              const SizedBox(width: 10), //Espaço entre os icones
              PopupMenuButton(
                  // Menu escondido
                  icon: Icon(Icons.more_horiz_outlined),
                  itemBuilder: (
                    context,
                  ) =>
                      const [
                        PopupMenuItem(
                          child: Text('New Group'),
                          value: "1",
                        ),
                        PopupMenuItem(
                          child: Text('Settings'),
                          value: "2",
                        ),
                        PopupMenuItem(
                          child: Text('Logout'),
                          value: "3",
                        )
                      ]),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: Colors.teal,
            title: const Text(
              'WhatsApp',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            bottom: const TabBar(tabs: [
              // O tabs precisa estar de acordo com o lenght

              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text('Chats')),
              Tab(child: Text('Status')),
              Tab(child: Text('Call')),
            ]),
          ),
          body: TabBarView(children: [
            //Nos filhos do Tab, encontra-se as "pages"
            Text('1'),
            ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) {
                return const ListTile(
                  leading: CircleAvatar(radius: 20,
                  backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/93539482?s=400&u=0b88462cda8d59824c72331d26d6cc6a29307cf7&v=4"),),
                  title: Text("Matheus Rodrigues"),
                  subtitle: Text('Já estudou hoje ?'),
                  trailing: Text('02:04 PM'),
                );
              }),
            ),
             ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) {
                return  ListTile(
                  leading: Container(
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 3
                      )
                    ),
                    child: const CircleAvatar(radius: 20,
                  backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/93539482?s=400&u=0b88462cda8d59824c72331d26d6cc6a29307cf7&v=4"),),
                  ),
                  title: Text("Matheus Rodrigues"),
                  subtitle: Text('20 minutos atrás'),
                );
              }),
            ),
            ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) {
                return  ListTile(
                  leading: const CircleAvatar(radius: 20,
                  backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/93539482?s=400&u=0b88462cda8d59824c72331d26d6cc6a29307cf7&v=4"),),
                  title: const Text("Matheus Rodrigues"),
                  subtitle: Text(index/2 == 0? 'Chamada perdida' : 'Duração da chamada 12:23 min'),
                  trailing: Icon(index/2 == 0? Icons.phone : Icons.video_call)
                );
              }),
            ),
          ]),
        ));
  }
}
