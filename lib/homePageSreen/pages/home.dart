import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/cardHome/cardhome.dart';



import '../data/style_Home.dart';

import '../Models/model.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _padding = 24.0;
  static const _spacing = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),
              header(),
              const SizedBox(height: 18),
              searchBar(),
              const SizedBox(height: 18),
              categories(),
              const SizedBox(height: 10),
              const Model(
                padding: _padding,
                spacing: _spacing,
              ),
              const SizedBox(height: 20),
              modelCategories(),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            FontAwesomeIcons.barsStaggered,
            color: kSecondaryColor,
            size: 24,
          ),
          Icon(
            FontAwesomeIcons.bell,
            color: kSecondaryColor,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kAvatarColor,
                      ),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: kAvatarColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            size: 30,
                            color: Color.fromARGB(255, 149, 150, 150),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Esentur Ch',
                      style: TextStyle(
                        color: kSecondaryColor.withOpacity(0.6),
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kAvatarColor,
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: kAvatarColor,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 27,
                  color: Color.fromARGB(255, 108, 173, 159),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Image.asset("assets/images/12345.png"),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSecondaryColor.withOpacity(0.04),
                  ),
                  
                ),
                SizedBox(width: 8),
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSecondaryColor.withOpacity(0.04),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardHome()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget categories() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: Text(
            'Сервисы',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Карты",
                          style: TextStyle(
                            color: kSecondaryColor.withOpacity(0.6),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Счета",
                    style: TextStyle(
                      color: kSecondaryColor.withOpacity(0.6),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Кредиты",
                    style: TextStyle(
                      color: kSecondaryColor.withOpacity(0.6),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Депозиты",
                    style: TextStyle(
                      color: kSecondaryColor.withOpacity(0.6),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget modelCategories() {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding),
                child: Text(
                  'Категории',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 165),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/list.png",
                    color: Color.fromARGB(255, 108, 173, 159),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white,
                              width: 60,
                              height: 60,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/transfer.png",
                                  color: Color.fromARGB(255, 108, 173, 159),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Переводы",
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white,
                              width: 60,
                              height: 60,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/pay.png",
                                  color: Color.fromARGB(255, 108, 173, 159),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Счета",
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white,
                              width: 60,
                              height: 60,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/bank-card.png",
                                  color: Color.fromARGB(255, 108, 173, 159),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Карта",
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white,
                              width: 60,
                              height: 60,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/bank.png",
                                  color: Color.fromARGB(255, 108, 173, 159),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "История",
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
