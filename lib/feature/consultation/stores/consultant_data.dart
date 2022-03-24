import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hackathon_app/core/api/api_client.dart';
import 'package:hackathon_app/feature/consultation/model/consultant.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:mobx/mobx.dart';

part 'consultant_data.g.dart';

class ConsultantData = ConsultantBase with _$ConsultantData;

abstract class ConsultantBase with Store {
  @observable
  List<Consultant> consultantRecommendation = [];

  @observable
  List<Topic> topics = [
    Topic(
      name: 'Instagram',
      description:
          'Instagram adalah platform visual berbasis seluler yang memungkinkan Anda berbagi gambar dan video. Popularitas Instagram telah meningkat dalam beberapa tahun terakhir dan diperkirakan akan tumbuh lebih besar karena konsumen terus menyukai video vertikal, video langsung, dan cerita. Instagram meluncurkan platform video dengan nama Reels, yang memungkinan user dapat mengeditnya secara menarik. Platform ini menjadi salah satu platform yang paling banyak digunakan untuk melakukan kegiatan marketing, mulai dari membangun sebuah konten hingga menjadi katalog.',
      isSelected: false,
    ),
    Topic(
      name: 'Facebook',
      description:
          'Facebook adalah platform yang memungkinkan anda berbagi banyak hal. Bisnis dapat menggunakan Facebook untuk berbagi konten, terlibat dengan pelanggan, menjalankan iklan, atau bahkan menggunakannya sebagai platform untuk memberikan dukungan pelanggan.',
      isSelected: false,
    ),
    Topic(
      name: 'Twitter',
      description:
          'Twitter memungkinkan Anda untuk mengekspresikan pendapat Anda dalam 280 karakter. Dikenal sebagai perintis penggunaan hashtag, Twitter adalah platform media sosial bagi pengguna untuk berbagi pemikiran, menjangkau merek dan selebriti, serta mengonsumsi berita dan cuplikan informasi.',
      isSelected: false,
    ),
    Topic(
      name: 'Youtube',
      description:
          'YouTube adalah platform berbagi video online yang memungkinkan Anda melihat, membagikan, dan mengupload konten video. Pertumbuhan eksponensial pemasaran video telah mendorong merek untuk membuat dan berbagi konten video di YouTube secara ekstensif.',
      isSelected: false,
    ),
    Topic(
      name: 'Tiktok',
      description:
          'TikTok merupakan salah satu platform yang sedang digemari saat ini sebagai media sosial untuk berbagi video. Konten yang bisa ditemukan di TikTok sangat beragam, mulai tayangan terkait kreativitas, video unik, challenge yang sedang viral, bernyanyi, menari, lipsync lagu, dan lain sebagainya. Saking banyaknya pengguna media sosial juga sebagai pengguna TikTok, maka jelas peluang untuk melakukan promosi di platform ini terbuka lebar. Jadi, inilah 5 strategi marketing lewat TikTok yang patut dicoba.',
      isSelected: false,
    ),
    Topic(
      name: 'Sosial Media Planning',
      description:
          'Sosial media marketing adalah bentuk pemasaran digital yang menggunakan media sosial dan situs web jaringan untuk mempromosikan produk atau layanan organisasi melalui cara berbayar dan organik.',
      isSelected: false,
    ),
    Topic(
      name: 'Copywriting',
      description:
          'Copywriting adalah suatu metode pembuatan materi pemasaran yang mampu membujuk audiens di dalamnya guna melakukan berbagai tindakan yang memang Anda inginkan, seperti membeli suatu produk ataupun layanan, berlangganan newsletter, menghubungi sales penjelasan, dll.',
      isSelected: false,
    ),
    Topic(
      name: 'Creative Design',
      description:
          'Creative designer adalah suatu pekerjaan yang berada di bidang marketing dan advertising. Semua marketing dan advertising materials seperti brosur atau label produk yang memberikan info tentang produk adalah salah satu bagian dari creative design.',
      isSelected: false,
    ),
    Topic(
      name: 'Facebook Ads',
      description:
          'Facebook Ads adalah fitur yang ditawarkan oleh Facebook untuk mempromosikan atau mengiklankan suatu Fan Page yang sebelumnya sudah dibuat oleh pengguna Facebook dengan jangkauan yang berbeda dan dapat diatur oleh pemasang iklan tersebut',
      isSelected: false,
    ),
    Topic(
      name: 'Google Ads',
      description:
          'Google Ads adalah program periklanan online Google. Melalui Google Ads, Anda dapat membuat iklan online untuk menjangkau orang-orang tepat pada saat mereka tertarik pada produk dan layanan yang Anda tawarkan.',
      isSelected: false,
    ),
    Topic(
      name: 'Landing Page',
      description:
          'Landing page adalah halaman dalam website yang didesain khusus dengan mindset marketing. Halaman inilah yang ditampilkan ketika pengunjung mengakses website dari hasil pencarian berbayar (paid search).',
      isSelected: false,
    ),
    Topic(
      name: 'Email Marketing',
      description:
          'Email marketing adalah bentuk pemasaran yang dapat membuat pelanggan berada di daftar email Anda sehingga mereka dapat mengetahui produk baru, diskon, dan layanan lainnya',
      isSelected: false,
    ),
    Topic(
      name: 'Marketplace',
      description:
          'Marketplace merupakan platform perantara yang bertugas menghubungkan pihak pembeli dan penjual. Anda dapat membuka toko dan menjual produk Anda di marketplace seperti Tokopedia, Bukalapak, Shopee, dan Lazada',
      isSelected: false,
    ),
  ];

  @observable
  Topic? selectedTopic;

  List<Consultant> tempConsultant = [];

  @observable
  bool isLoadingConsultantRecommendation = false;

  @action
  Future<void> getConsultantRecommendation({int? limit}) async {
    isLoadingConsultantRecommendation = true;
    consultantRecommendation.clear();
    tempConsultant.clear();
    List<Consultant?>? consultantList = [];
    try {
      Response response = await ApiClient().init().request(
            'https://anjardhan.com/api/konsultan',
            options: Options(method: 'GET'),
          );
      if (response.statusCode == 200) {
        consultantList = (response.data['data'] as List)
            .map((e) => Consultant.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      consultantList.forEach((element) {
        consultantRecommendation.add(element!);
        tempConsultant.add(element);
      });

      if (limit != null) {
        consultantRecommendation =
            consultantRecommendation.take(limit).toList();
      }

      isLoadingConsultantRecommendation = false;
    } on DioError {
      isLoadingConsultantRecommendation = false;
    }
  }

  @action
  void searchConsultantByNameTopic({required String nameTopic}) {
    isLoadingConsultantRecommendation = true;

    List<Consultant> consultantByName = tempConsultant
        .where((element) => (element.name
                .toLowerCase()
                .contains(nameTopic.toLowerCase()) ||
            element.expertise.toLowerCase().contains(nameTopic.toLowerCase())))
        .toList();

    consultantRecommendation.clear();
    consultantRecommendation.addAll(consultantByName);
    isLoadingConsultantRecommendation = false;
  }

  @action
  Future<void> getConsultantRecommendationByTopic(
      {required String topic}) async {
    isLoadingConsultantRecommendation = true;
    consultantRecommendation.clear();
    List<Consultant?>? consultantList = [];
    try {
      Response response = await ApiClient().init().request(
          'https://anjardhan.com/api/search',
          options: Options(method: 'GET'),
          queryParameters: {'topik': topic});
      if (response.statusCode == 200) {
        consultantList = (response.data['data'] as List)
            .map((e) => Consultant.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      consultantList.forEach((element) {
        consultantRecommendation.add(element!);
      });
      isLoadingConsultantRecommendation = false;
    } on DioError {
      isLoadingConsultantRecommendation = false;
    }
  }
}
