import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool isBrownspotInfoVisible = false;

  void showBrownspotInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Brown Spot'),
            content: Column(
              children: [
                Image.asset('images/brownspot.jpg', height: 200.0),
                SizedBox(height: 10.0),
                Text(
                    'Brownspot pada padi adalah penyakit yang disebabkan oleh jamur Cochliobolus miyabeanus. Gejala utamanya adalah munculnya bercak cokelat pada daun, batang, dan malai padi. Untuk mengatasi brownspot, langkah-langkah yang dapat diambil antara lain memilih varietas padi yang tahan terhadap penyakit ini, melakukan rotasi tanaman dengan tanaman non-padi, membersihkan sisa-sisa tanaman yang terinfeksi, menjaga kepadatan tanaman yang tepat, mengatur irigasi yang baik, dan penggunaan fungisida jika serangan sudah signifikan.'),
                SizedBox(height: 10.0),
                Text(
                    'Penting untuk dicatat bahwa pengendalian brownspot pada padi dapat bervariasi tergantung pada kondisi dan faktor lingkungan setempat. Oleh karena itu, disarankan untuk berkonsultasi dengan ahli pertanian atau petugas pertanian setempat untuk mendapatkan saran yang sesuai dengan situasi spesifik yang dihadapi.'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  void showHispaInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Hispa'),
            content: Column(
              children: [
                Image.asset('images/hispa.jpg', height: 200.0),
                SizedBox(height: 10.0),
                Text(
                    'Hispa pada padi adalah serangga yang sering menyerang tanaman padi. Serangga ini dikenal dengan nama ilmiahnya, Nilaparvata lugens, dan sering disebut juga sebagai wereng padi cokelat. Hispa dapat menyebabkan kerusakan serius pada tanaman padi dengan mengisap cairan dari jaringan tanaman dan menyebabkan daun menguning, melengkung, dan bahkan mati. Serangan hispa pada padi dapat mengurangi hasil panen dan mengganggu pertumbuhan tanaman. Untuk mengatasi hispa, beberapa langkah yang dapat diambil adalah melakukan pemantauan secara rutin, menerapkan praktik budidaya yang baik seperti penanaman varietas tahan hispa, penggunaan jaring penghalang, dan jika serangan sudah signifikan, penggunaan insektisida yang disarankan oleh ahli pertanian.'),
                SizedBox(height: 10.0),
                Text(
                    'Penting untuk mencatat bahwa pengendalian hispa pada padi perlu disesuaikan dengan kondisi dan faktor lingkungan setempat. Oleh karena itu, disarankan untuk berkonsultasi dengan ahli pertanian atau petugas pertanian setempat untuk mendapatkan saran yang sesuai dan spesifik sesuai dengan situasi yang dihadapi.'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  void showLeafblastInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Leafblast'),
            content: Column(
              children: [
                Image.asset('images/leafblast.jpg', height: 200.0),
                SizedBox(height: 10.0),
                Text(
                    'Leaf blast pada padi adalah penyakit yang disebabkan oleh jamur Pyricularia oryzae. Penyakit ini sering menyerang daun, batang, malai, dan bahkan leher tanaman padi. Gejala utama leaf blast adalah munculnya bercak berwarna cokelat atau keabu-abuan dengan tepi yang berbentuk melingkar pada daun. Bercak ini dapat membesar dan bergabung, menyebabkan kerusakan yang signifikan pada tanaman padi, termasuk kehilangan hasil panen. Untuk mengatasi leaf blast, beberapa langkah yang dapat diambil termasuk memilih varietas padi yang tahan terhadap penyakit ini, menjaga kebersihan lahan dengan menghilangkan sisa-sisa tanaman yang terinfeksi, melakukan rotasi tanaman, memperhatikan pengaturan kepadatan tanaman, menerapkan pemupukan yang tepat, dan menggunakan fungisida yang direkomendasikan oleh ahli pertanian jika serangan sudah parah.'),
                SizedBox(height: 10.0),
                Text(
                    'Penting untuk dicatat bahwa langkah-langkah pengendalian leaf blast pada padi perlu disesuaikan dengan kondisi lokal dan faktor lingkungan. Oleh karena itu, konsultasikan dengan ahli pertanian atau petugas pertanian setempat untuk mendapatkan panduan yang lebih spesifik dan sesuai dengan situasi yang dihadapi.'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  void showTips(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Leafblast'),
            content: Column(
              children: [
                Text(
                    'Berikut adalah beberapa tips untuk menjaga kesehatan padi:'),
                SizedBox(height: 10.0),
                Text(
                    '1. Memilih varietas yang tahan terhadap penyakit: Pilih varietas padi yang memiliki ketahanan terhadap penyakit yang umum terjadi di wilayah Anda. Varietas yang tahan terhadap penyakit dapat membantu mengurangi risiko serangan dan kerusakan tanaman.'),
                SizedBox(height: 10.0),
                Text(
                    '2. Menjaga kebersihan lahan: Bersihkan sisa-sisa tanaman dan gulma di sekitar lahan padi. Sisa-sisa tanaman yang terinfeksi dapat menjadi sumber penyakit, sedangkan gulma dapat menjadi tempat berkembang biak bagi hama dan penyakit.'),
                SizedBox(height: 10.0),
                Text(
                    '3. Pengaturan kepadatan tanaman: Pastikan kepadatan tanaman padi sesuai dengan rekomendasi yang dianjurkan. Tanaman yang terlalu rapat dapat menciptakan lingkungan yang lembab dan memicu pertumbuhan penyakit.'),
                SizedBox(height: 10.0),
                Text(
                    '4. Pemupukan yang seimbang: Berikan pemupukan yang tepat untuk tanaman padi. Kekurangan nutrisi atau pemupukan yang berlebihan dapat melemahkan tanaman dan membuatnya rentan terhadap serangan penyakit.'),
                SizedBox(height: 10.0),
                Text(
                    '5. Pengelolaan irigasi yang baik: Atur irigasi secara efisien untuk menghindari genangan air yang berlebihan di lapangan padi. Genangan air yang berlebihan dapat menyebabkan kondisi yang ideal bagi perkembangan penyakit.'),
                SizedBox(height: 10.0),
                Text(
                    '6. Penggunaan insektisida dan fungisida yang tepat: Jika serangan hama atau penyakit terjadi, konsultasikan dengan ahli pertanian atau petugas pertanian setempat untuk mengetahui insektisida atau fungisida yang direkomendasikan untuk mengendalikan masalah tersebut.'),
                SizedBox(height: 10.0),
                Text(
                    '7. Pemantauan dan tindakan cepat: Pantau tanaman padi secara teratur untuk mendeteksi tanda-tanda awal penyakit atau serangan hama. Jika terjadi masalah, lakukan tindakan cepat untuk mencegah penyebaran dan mengurangi dampaknya.'),
                SizedBox(height: 10.0),
                Text(
                    'Ingatlah bahwa praktik pengendalian penyakit dan hama pada padi dapat bervariasi tergantung pada lokasi geografis, jenis varietas, dan kondisi lingkungan. Jadi, selalu penting untuk mendapatkan saran dari ahli pertanian atau petugas pertanian setempat yang memiliki pengetahuan yang lebih spesifik tentang daerah Anda.')
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            ListTile(
              title: Text('Brown Spot'),
              trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
              onTap: () {
                showBrownspotInfo(context);
              },
            ),
            ListTile(
              title: Text('Hispa'),
              trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
              onTap: () {
                showHispaInfo(context);
              },
            ),
            ListTile(
              title: Text('Leaf Blast'),
              trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
              onTap: () {
                showLeafblastInfo(context);
              },
            ),
            ListTile(
              title: Text('Tips menjaga kesehatan padi'),
              trailing: Icon(Icons.arrow_forward_ios, size: 15.0),
              onTap: () {
                showTips(context);
              },
            )
          ])),
    );
  }
}
