import 'package:flutter/material.dart';

class Task4 extends StatelessWidget {
  const Task4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsWN16-GJLNfPjQwEBez1M_dzCPTVkldkSO0Azw-vFgg&s"),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
               
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                 Text(
                  'Marsha Bara Suwarna',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                 Text(
                  'Marsha Bara Suwarna',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ]
                ),
                Spacer(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [   
                    Container(
                      width: double.infinity,
                      height: 25,
                      decoration:BoxDecoration(
                      color: const Color.fromARGB(255, 255, 235, 235),
                      borderRadius: BorderRadius.circular(10)
                    ),    
                    child: Text(
                      'Task 4',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                      
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Flutter',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam hendrerit nisi quis neque porttitor, vitae posuere lacus porttitor. Proin facilisis auctor dui, vestibulum tempor enim lacinia eu. Integer ac consectetur lectus, sit amet tincidunt ante. Praesent imperdiet, nisi ut ultrices maximus, justo velit pretium lorem, quis fringilla orci ligula vel ipsum. Vivamus efficitur viverra enim, sed vulputate massa vestibulum vel. Aenean nec augue in lectus consequat feugiat non vel purus. In venenatis sollicitudin eleifend. Nulla ullamcorper dui vel augue sollicitudin, sit amet efficitur quam malesuada. Vivamus condimentum tellus lectus, in porta lacus facilisis non.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        print('Lihat selengkapnya');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Lihat selengkapnya'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}