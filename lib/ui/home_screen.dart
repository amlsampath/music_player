import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_animation/constant/color_constant.dart';
import 'package:login_animation/model/song_model.dart';
import 'package:login_animation/ui/detail_screen.dart';
import 'package:login_animation/ui/reusable_widget/circle_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<HomeScreen> {
  List<SongModel> _songList = [
    SongModel(
      author: 'Peter Ham, Tom Evans',
      songName: "Harry Nilsson, ‘Without You’",
      image: 'https://media.istockphoto.com/photos/heart-shape-paper-book-on-the-beach-picture-id817147678?b=1&k=20&m=817147678&s=170667a&w=0&h=zFCKH6K4jBGw_OUCSwOZerHZfo28zWm6mJtsI91GZEQ=',
    ),
    SongModel(
      author: 'Carly Simon',
      songName: "Carly Simon, ‘You’re So Vain’",
      image: 'https://images.unsplash.com/photo-1509043759401-136742328bb3?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb',
    ),
    SongModel(
      author: 'Cyndi Lauper, Rob Hyman',
      songName: "Cyndi Lauper, ‘Time After Time’",
      image: 'https://c4.wallpaperflare.com/wallpaper/604/958/393/photography-child-bokeh-dandelion-wallpaper-preview.jpg',
    ),
    SongModel(
      author: 'Black Francis',
      songName: "The Pixies, ‘Where Is My Mind?’",
      image: 'https://rare-gallery.com/uploads/posts/2000794-pretty-little-grass-fluffy-adorable-bow-sweet-dandelion-flowers-enjoy-kitty-fun-spring-cat-freshness-pet-cute-garden-kitten.jpg',
    ),
    SongModel(
      author: 'Miles Davis',
      songName: "Miles Davis, ‘So What’",
      image: 'https://images.unsplash.com/photo-1552845656-cc75ded3126c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHw%3D&w=1000&q=80',
    ),
    SongModel(
      author: 'Duff McKagan, Jeffrey Isbel',
      songName: "Guns N’ Roses, ‘Welcome to the Jungle",
      image: 'https://data.1freewallpapers.com/download/black-long-hair-cute-little-girl-is-wearing-white-dress-standing-in-blur-green-grass-background-cute-1152x864.jpg',
    ),
    SongModel(
      author: 'Peter Ham, Tom Evans',
      songName: "Harry Nilsson, ‘Without You’",
      image: 'https://images.pexels.com/photos/35188/child-childrens-baby-children-s.jpg?cs=srgb&dl=pexels-bess-hamiti-35188.jpg&fm=jpg',
    ),
    SongModel(
      author: 'Peter Ham, Tom Evans',
      songName: "Harry Nilsson, ‘Without You’",
      image: 'https://media.istockphoto.com/photos/heart-shape-paper-book-on-the-beach-picture-id817147678?b=1&k=20&m=817147678&s=170667a&w=0&h=zFCKH6K4jBGw_OUCSwOZerHZfo28zWm6mJtsI91GZEQ=',
    ),
    SongModel(
      author: 'Carly Simon',
      songName: "Carly Simon, ‘You’re So Vain’",
      image: 'https://images.unsplash.com/photo-1509043759401-136742328bb3?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb',
    ),
    SongModel(
      author: 'Cyndi Lauper, Rob Hyman',
      songName: "Cyndi Lauper, ‘Time After Time’",
      image: 'https://c4.wallpaperflare.com/wallpaper/604/958/393/photography-child-bokeh-dandelion-wallpaper-preview.jpg',
    ),
    SongModel(
      author: 'Black Francis',
      songName: "The Pixies, ‘Where Is My Mind?’",
      image: 'https://rare-gallery.com/uploads/posts/2000794-pretty-little-grass-fluffy-adorable-bow-sweet-dandelion-flowers-enjoy-kitty-fun-spring-cat-freshness-pet-cute-garden-kitten.jpg',
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(size.width * .05),
            child: Column(
              children: [
                const Text(
                  'Your Music Player',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleButton(
                      onTap: () {
                        // Navigator.of(context).pop();
                      },
                      icon: Icons.favorite,
                      iconColor: ColorConstant.iconColor,
                      bgColor: ColorConstant.appMainColor,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: ColorConstant.appMainColor,
                        borderRadius: BorderRadius.circular(
                          size.width * .4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: const Offset(4, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: size.width * .2,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: _songList[_selectedIndex].image,
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
                              color: HexColor("#6790fe"),
                            ),
                            fit: BoxFit.cover,
                            width: size.width * .8,
                            height: size.width * .8,
                          ),
                        ),
                      ),
                    ),
                    CircleButton(
                      onTap: () {},
                      icon: Icons.more_horiz_sharp,
                      iconColor: ColorConstant.iconColor,
                      bgColor: ColorConstant.appMainColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _songList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: _selectedIndex == index
                              ? BoxDecoration(color: Colors.blue.withOpacity(.2), borderRadius: BorderRadius.circular(15.0), boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 1,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ])
                              : BoxDecoration(),
                          margin: EdgeInsets.only(
                            left: 5.0,
                            right: 5.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _songList[index].songName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    _songList[index].author,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0,
                                    ),
                                  )
                                ],
                              ),
                              CircleButton(
                                onTap: () {
                                  Get.to(
                                      DetailsScreen(
                                        songData: _songList[index],
                                      ),
                                      transition: Transition.circularReveal,
                                      duration: Duration(
                                        seconds: 5,
                                      ));
                                },
                                padding: 8.0,
                                isSelected: _selectedIndex == index,
                                icon: Icons.play_arrow,
                                iconColor: ColorConstant.iconColor,
                                bgColor: ColorConstant.appMainColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
