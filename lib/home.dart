import 'package:flutter/material.dart';
import 'package:myapp/data.dart';
import 'package:myapp/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String>bookmarkedScholarships = [];

  void bookmarkIt(int index){
    setState((){
      (bookmarkedScholarships.contains((schList[index]['schName'])))
      ? bookmarkedScholarships.remove(schList[index]['schName'])
      : bookmarkedScholarships.add(schList[index]['schName']);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 241, 241, 249),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child:Padding(
          padding:  const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: appbar(),
        )
      ),
      bottomNavigationBar: nav(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:SingleChildScrollView(
              child: Container(
                decoration:  const BoxDecoration(
                  color: Color.fromARGB(232, 241, 241, 249)
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        searchbar(context),
                        categoryFilter(),
                        scholarshipList(context),
                        latestFeeds(context)
                      ],
                    )
                  ]
                )
              )

            )

          )
        ]
    )
    );
  }

  Widget nav(){
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.white70, blurRadius: 20, offset: Offset(0, -10), spreadRadius: 1)],
        color: Colors.white70
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
        children:[
          Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.dashboard_rounded, size: 24, color: Colors.black)),
              const Text('Beranda', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black))
            ]
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_outlined, size: 24, color: Colors.black26)),
              const Text('Bookmark', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black26))
            ]
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_sharp, size: 24, color: Colors.black26)),
              const Text('Notifikasi', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black26))
            ]
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.person_sharp, size: 24, color: Colors.black26)),
              const Text('Profil', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black26))
            ]
          ),
        ]
      ),
    );
  }

  Widget searchbar(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: const BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children:  [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search_rounded, size: 30, color: Colors.black26)
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText:  'Cari Beasiswa',
                      border: UnderlineInputBorder(borderSide: BorderSide.none)
                    )
                  )
                ),
              ]
            )
          ),
          
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10,0, 10, 0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 178, 231, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.sort, size:30, color: Colors.lightBlueAccent)
                )
              )
            ]
          ),
        ]
      )
    );
    
  }

  Widget scholarshipList(context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 380,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: schList.length,
          itemBuilder: (context, index)  {
            final String imagePath =  schList[index]['details']['ímageHref'];
            return Container(
              padding: const EdgeInsets.fromLTRB(15,10,15,15),
              child: Container(
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                        height: 210,
                        decoration:  BoxDecoration(
                          color: Colors.black, 
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(imagePath),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 10,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 246, 246, 252),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
                      ),)
                      ),
                      ]
                      
                    ),
                    Container(padding: const EdgeInsets.fromLTRB(10,0,10,0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(schList[index]['schName'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        )),
                        Text(schList[index]['details']['totalAccepted'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:Colors.black54
                        ))
                      ]
                    )
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Text(schList[index]['details']['description'], 
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),),
                    ),
                    Container(padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(140, 30),
                            backgroundColor: Colors.lightBlue.shade400,
                            foregroundColor: Colors.black54,
                            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                            ),
                          ),
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(isBookmarked: bookmarkedScholarships.contains(schList[index]['schName']),schIndex: index,)));},
                            child: const Text('Lihat Detail', style: TextStyle(color: Colors.white, letterSpacing:0.5))
                        ),
                        IconButton(onPressed: (){bookmarkIt(index);}, icon: Icon(
                          (bookmarkedScholarships.contains(schList[index]['schName']))
                          ? Icons.bookmark
                          : Icons.bookmark_outline
                          ))
                      ]
                    ),)
                  ]
                )
              )
            );
          },
        ),
      )
    );
  }

  Widget latestFeeds(context){
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 180,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: feeds.length,
            itemBuilder: (context, index)  {
              final String imagePath =  feeds[index]['imageHref'];
              return Container(
                padding: const EdgeInsets.fromLTRB(15,10,15,15),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                width: MediaQuery.of(context).size.width * 3/4,
                decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          decoration:  BoxDecoration(
                            color: Colors.black, 
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(imagePath),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 2/4 - 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(feeds[index]['title'], style: TextStyle(fontWeight: FontWeight.w600)),
                              Text(feeds[index]['desc'], style: TextStyle(overflow: TextOverflow.ellipsis,), maxLines: 2),
                            ]
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('Detail'), style:ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.transparent))
                      ]
                    )
                  ]
                ),
              );
            },
          ),
        )
      );
  }

  Widget appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(232, 241, 241, 249),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape:BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(image: AssetImage('assets/images/person.jpg'), fit: BoxFit.cover)
            )
          )
        )
      ],
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Selamat Datang !', style: TextStyle(fontSize:16,
          fontWeight: FontWeight.w400,
          color: Colors.black45)),
          Text('Kadek Faraday', style: TextStyle(fontSize:24, fontWeight: FontWeight.w500))
        ]
      )
    );
  }

  Widget categoryFilter() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((text) => Text(text['name'], style: TextStyle(
          fontSize: double.parse(text['details']['value']),
          color: text['details']['color']
        )))
        .toList()
      )
    );

  }
}