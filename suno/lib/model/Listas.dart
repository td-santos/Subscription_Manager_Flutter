
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Map<int,Map<String,String>> mapLogos = {
  //0: "assets/netflix.png",
  
  0: {"Spotify":"assets/spotify.jpg"},
  1: {"Apple Music":"assets/apple_music.jpg"},
  2: {"Deezer":"assets/deezer.jpg"},
  3: {"Youtube Music":"assets/youtube_music.png"},
  4: {"Youtube Premium":"assets/youtube_premium.jpg"},// ver
  5: {"Google Play Music":"assets/google_playmusic.png"},
  6: {"Amazon Music":"assets/amazon_music.jpg"},
  7: {"Claro Musica":"assets/claro_musica.png"},
  8: {"Napster":"assets/napster.jpg"},
  9: {"Rdio":"assets/rdio.jpg"},
  10: {"Tidal":"assets/tidal.png"},

  11:{"Netflix":"assets/netflix.png"},
  12:{"Amazon Prime Video":"assets/amazon_primevideo.jpg"},
  13:{"Crunchyroll":"assets/crunchyroll.jpg"},
  14:{"Globo Play":"assets/globoplay.png"},
  15:{"Looke":"assets/looke.png"},
  16:{"Telecine":"assets/telecine.jpg"},
  17:{"Viki":"assets/viki.png"},
  18:{"Hulu":"assets/hulu.png"},
  19:{"HBO":"assets/hbo.png"},
  20:{"Disney+":"assets/disney_pluss.png"},
  21:{"Crackle":"assets/crackle.jpg"},
  22:{"Fox Play":"assets/fox_play.jpg"},
  23:{"Kinopop":"assets/kinopop.jpg"},

  24:{"Apple Arcade":"assets/apple_arcade.jpeg"},
  25:{"Google Stadia":"assets/stadia.jpg"},
  26:{"Playstation Network":"assets/psn.png"},
  27:{"Xbox Live":"assets/xbox_live.jpg"},
  28:{"Ea Access":"assets/ea_access.jpg"},
  29:{"Xbox GamePass":"assets/xbox_gamepass.jpg"},
  30:{"Origin Access":"assets/origin_access.jpg"},
  31:{"Humble Monthly":"assets/humbleM.png"},
  32:{"Utomik":"assets/utomik2.jpg"},
  33:{"Verizon":"assets/verizon.jpg"},

  34:{"Google Drive":"assets/google_drive.jpg"},
  35:{"Icloud":"assets/icloud.jpeg"},
  36:{"DropBox":"assets/dropbox.jpg"},
  37:{"Asus Webstorage":"assets/asus_webstorage.jpg"},
  38:{"Amazon Drive":"assets/amazon_drive.jpg"},

  39:{"Adobe Creative Cloud":"assets/adobe_creative.jpeg"},
  40:{"Figma":"assets/figma.png"},
  41:{"Sketch":"assets/sketch.png"},
  42:{"Abobe":"assets/adobe_logo.png"},
  43:{"Canva":"assets/canva.jpg"},
  44:{"Dribbble":"assets/dribbble.png"},
  45:{"Sony Vegas":"assets/vegas_pro.png"},
  46:{"Wix":"assets/wix.jpg"},

  47:{"MS Office":"assets/office.jpg"},
  48:{"Slack":"assets/slack.jpg"},
  49:{"Zoom":"assets/zoom.jpeg"},
  50:{"Linkedin Premium":"assets/linkedin_premium.jpg"},
  51:{"Kindle Unlimited":"assets/kindle_unlimited.jpg"},
  52:{"Google Gsuite":"assets/gsuite.jpg"},
  53:{"Trello":"assets/trello.png"},
  54:{"Team Viewer":"assets/team_viewer.png"},

  55:{"BlueHost":"assets/bluehost.jpg"},
  56:{"GoDaddy":"assets/godaddy.jpg"},
  57:{"HostGator":"assets/hostgator.png"},
  58:{"Hostinger":"assets/hostinger.png"},
  59:{"KingHost":"assets/kinghost.jpg"},
  60:{"LocaWeb":"assets/locaweb.png"},
  61:{"WebLink":"assets/weblink.png"},
  //:{"":""},
};

Map<int,String> mapLogoOutros ={
  0: "assets/office.jpg",
  1: "assets/slack.jpg",
  2: "assets/zoom.jpeg",
  3: "assets/linkedin_premium.jpg",
  4: "assets/kindle_unlimited.jpg",
  5: "assets/gsuite.jpg",
  6: "assets/trello.png",
  7: "assets/team_viewer.png",
};

Map<int,String> mapLogoHost ={
  0: "assets/bluehost.jpg",
  1: "assets/godaddy.jpg",
  2: "assets/hostgator.png",
  3: "assets/hostinger.png",
  4: "assets/kinghost.jpg",
  5: "assets/locaweb.png",
  6: "assets/weblink.png",
  
};

Map<int,String> mapLogoGames ={
  0: "assets/apple_arcade.jpeg",
  1: "assets/stadia.jpg",
  2: "assets/psn.png",
  3: "assets/xbox_live.jpg",
  4: "assets/ea_access.jpg",
  5: "assets/xbox_gamepass.jpg",
  6: "assets/nintendo_online.jpg",
  7: "assets/origin_access.jpg",
  8: "assets/humbleM.png",
  9: "assets/utomik2.jpg",
  10: "assets/verizon.jpg",
};

Map<int,String> mapLogoMusic ={
  0: "assets/spotify.jpg",
  1: "assets/apple_music.jpg",
  2: "assets/deezer.jpg",
  3: "assets/youtube_music.png",
  4: "assets/youtube_premium.jpg",// ver
  5: "assets/google_playmusic.png",
  6: "assets/amazon_music.jpg",
  7: "assets/claro_musica.png",
  8: "assets/napster.jpg",
  9: "assets/rdio.jpg",
  10: "assets/tidal.png",
};

Map<int,String> mapLogoVideo ={
  0: "assets/netflix.png",
  1: "assets/amazon_primevideo.jpg",
  2: "assets/apple_tv.jpg",
  3: "assets/crunchyroll.jpg",
  4: "assets/globoplay.png",
  5: "assets/looke.png",
  6: "assets/telecine.jpg",
  7: "assets/viki.png",
  8: "assets/hulu.png",
  9: "assets/hbo.png",
  10: "assets/disney_pluss.png",
  11: "assets/crackle.jpg",
  12: "assets/fox_play.jpg",
  13: "assets/kinopop.jpg",
  
};
Map<int,String> mapLogoDrive ={
  0: "assets/google_drive.jpg",
  1: "assets/icloud.jpeg",
  2: "assets/dropbox.jpg",
  3: "assets/asus_webstorage.jpg",
  4: "assets/amazon_drive.jpg",
  
};

Map<int,String> mapLogoDesign ={
  0: "assets/adobe_creative.jpeg",
  1: "assets/figma.png",
  2: "assets/sketch.png",
  3: "assets/adobe_logo.png",
  4: "assets/canva.jpg",
  5: "assets/dribbble.png",
  6: "assets/vegas_pro.png",
  7: "assets/wix.jpg",
};


Map<int, dynamic> mapIconLogos = {
  0: FontAwesomeIcons.music, //music
  1: FontAwesomeIcons.gamepad, //game
  2: FontAwesomeIcons.boxOpen, //misteryBox ou cube
  3: FontAwesomeIcons.bookOpen, //livros
  4: FontAwesomeIcons.palette, //design
  5: FontAwesomeIcons.tv, //tv cabo
  6: FontAwesomeIcons.graduationCap, //educaçao
  7: FontAwesomeIcons.utensils, //comida
  8: Icons.cast, //stream video
  9: FontAwesomeIcons.users, //social media
  10: FontAwesomeIcons.stethoscope, //saude
  11: FontAwesomeIcons.googlePlay, // apps
  12: FontAwesomeIcons.cube,
  13: FontAwesomeIcons.gem,
  14: FontAwesomeIcons.question,
  15: FontAwesomeIcons.rocketchat,
  16: FontAwesomeIcons.wifi,
};