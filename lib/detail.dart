import 'package:flutter/material.dart';
import 'package:myapp/data.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.schIndex});
  
  final int schIndex;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  bool isExpand = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 2/4,
                        decoration:  BoxDecoration(
                          color: Colors.black, 
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(schList[widget.schIndex]['details']['ímageHref']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 10,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 246, 246, 252),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
                      ),)
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration:BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)),) ,
                    child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);},)
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(schList[widget.schIndex]['schName'], style: TextStyle(fontWeight: FontWeight.w700, fontSize:24)),
                    IconButton(icon: Icon(Icons.bookmark), onPressed: (){},)
                  ]
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration:  BoxDecoration(
                        color: Colors.black, 
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(schList[widget.schIndex]['details']['órganizerÍmageHref']),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Penyelenggara', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Text(schList[widget.schIndex]['details']['organizer'], style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(Icons.verified, color: Colors.blueAccent,)
                          ],
                        )
                      ],
                    )
                  ]
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(schList[widget.schIndex]['details']['target'])
                      ],
                    ),
                    Row(
                      children: [
                        Text('Quota: ', style: TextStyle(color: Colors.black87)),
                        Text(schList[widget.schIndex]['details']['totalAccepted'], style: TextStyle(color: Colors.black87))
                      ],
                    )
                  ],
                ),
              ),
              scheduleList(context),
              description(),
            ]
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(context),
    );
  }

  Widget scheduleList(context){

    List keys = schList[widget.schIndex]['timeline'].keys.toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: keys.length,
          itemBuilder: (context, index)  {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              width: MediaQuery.of(context).size.width * 2/3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(keys[index]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month),
                      Text(schList[widget.schIndex]['timeline'][keys[index]])
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

  Widget description(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deskripsi Beasiswa', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),),
          SizedBox(height: 10,),
          Text(schList[widget.schIndex]['details']['description'],
            overflow: isExpand ? TextOverflow.ellipsis : TextOverflow.visible,
            textAlign: TextAlign.justify,
            maxLines: isExpand ? 8 : null,
          ),
          ElevatedButton(onPressed: () => setState(() => isExpand = !isExpand), child: Text(isExpand ? 'Baca Selengkapnya' : 'Baca Lebih Sedikit', style: TextStyle(color: Colors.blueAccent),),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
              ),
          )
        ]
      ),
    );
  }

  Widget bottomNav(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jadwal Pendaftaran', style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600)),
              Text(schList[widget.schIndex]['timeline']['Pendaftaran'])
            ],
          ),
          Column(
            children:[
              ElevatedButton(
                onPressed: (){},
                child: Text('Pelajari Selengkapnya', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
              ))
            ]
          )
        ],
      ),
    );
  }
}