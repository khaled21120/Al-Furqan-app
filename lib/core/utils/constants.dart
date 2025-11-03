import '../../features/home/data/models/recite_model.dart';

abstract class Constants {
  static const String _images = 'assets/images/';
  static const String _json = 'assets/json/';

  static const String quran = '${_images}quran.svg';
  static const String appbar = '${_images}Quran.png';
  static const String splash = '${_images}splash.svg';
  static const String star = '${_images}star.svg';
  static const String logo = '${_images}logo.png';
  static const String intro = '${_images}intro.json';
  static const String azkarJson = '${_json}azkar.json';
  static const String bismillah = '${_images}bismillah.svg';
  static const String recitation = '${_images}recite.svg';
  static const String smallBook = '${_images}small_book.svg';
  static const String mosque = '${_images}mosque.svg';
  static const String azkar = '${_images}azkar.svg';
  static const String sebha = '${_images}sebha.png';
  static const String praying = '${_images}praying.svg';
  static const String headPhone = '${_images}headphone.svg';
  static const String appDesc =
      'تطبيق الفرقان هو رفيقك المثالي في حياتك اليومية، حيث يتيح لك قراءة القرآن الكريم مع التفسير لكل آية، بالإضافة إلى الاستماع للقرآن بصوت مجموعة من الشيوخ المشهورين مع إمكانية تحميل الأصوات المفضلة. كما يوفر التطبيق خاصية معرفة أوقات الصلاة حسب مدينتك.\n\n'
      'يحتوي التطبيق أيضًا على مكتبة ضخمة من الأحاديث النبوية، حيث يمكنك قراءة العديد من أنواع الأحاديث واختيار الأنسب لك. بالإضافة إلى ذلك، يضم مجموعة من الأذكار اليومية التي يمكنك تكرارها .\n\n'
      'كما يدعم التطبيق الوضع الليلي لتجربة استخدام مريحة في جميع الأوقات، ويوفر لك أيضًا سبحة رقمية لتمكينك من تسبيح الله بسهولة في أي وقت.';

  static const String facebook = 'https://www.facebook.com/Khaaaaaaleeeeeeeed/';
  static const String github = 'https://github.com/khaled21120';
  static const String linkedin = 'https://www.linkedin.com/in/khaled-gamal-k/';

  static const List<double> height = [160, 191, 191, 160, 160, 191];
  static const List<String> images = [
    smallBook,
    headPhone,
    mosque,
    azkar,
    recitation,
    praying,
  ];
  static const List<String> title = [
    'المصحف',
    'ٳستماع',
    'مواعيد الصلاة',
    'الاذكار',
    'السبحة',
    'الأحاديث',
  ];
  static const List<Map<String, String?>> azkarCategories = [
    {'id': "أذكار الصباح", 'title': 'أذكار الصباح'},
    {'id': "أذكار المساء", 'title': 'أذكار المساء'},
    {
      'id': "أذكار بعد السلام من الصلاة المفروضة",
      'title': "أذكار بعد السلام من الصلاة",
    },
    {'id': "تسابيح", 'title': "تسابيح"},
    {'id': "أذكار الاستيقاظ", 'title': 'أذكار الأستيقاظ'},
    {'id': "أذكار النوم", 'title': "أذكار النوم"},
    {'id': "أدعية قرآنية", 'title': "أدعية قرآنية"},
    {'id': "أدعية الأنبياء", 'title': "أدعية الأنبياء"},
  ];
  static const List<ReciteModel> reci = [
    ReciteModel(
      endPoint: 'ar.abdulbasitmujawwad',
      name: 'عبد الباسط عبد الصمد',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMBpW-JH7CACcz6PFC2Nt2MmwOsJouxDBiag&s',
    ),
    ReciteModel(
      endPoint: 'ar.alafasy',
      name: 'مشاري راشد العفاسي',
      imgURL: 'https://i1.sndcdn.com/artworks-000088975436-n33pt8-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 'ar.muhammadsiddiqalminshawimujawwad',
      name: 'محمد صديق المنشاوي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQhhTub-NbkWaMsfvXfxMAYC4dAEJnkZiO3g&s',
    ),
    ReciteModel(
      endPoint: 'ar.yasseraldossari',
      name: 'ياسر الدوسري',
      imgURL:
          'https://i1.sndcdn.com/artworks-yqaFIhjTMlyQyFHL-5PmjKw-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 'ar.nasseralqatami',
      name: 'ناصر القطامي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh3vbUgHBa_nlQVf575jnemxuWzlqA3Uhqbg&s',
    ),
    ReciteModel(
      endPoint: 'ar.mahmoudalialbanna',
      name: 'محمود علي البنا',
      imgURL:
          'https://i1.sndcdn.com/artworks-gd2VK9TkQ11WYC4l-66KqcQ-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 'ar.khalidaljalil',
      name: 'خالد الجليل',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzRWTp5Ca6Tsadad8j26TtpDAdB8EFgoVrcw&s',
    ),
    ReciteModel(
      endPoint: 'ar.ahmedalajmi',
      name: 'أحمد العجمي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdI1GCwt6qGvTd1AgYrJ-9eyfa-qb2zs51KA&s',
    ),
    ReciteModel(
      endPoint: 'ar.mohamedtablawi',
      name: 'محمد الطبلاوي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE7pjs099-f_RTosvGtIoGrZe0c2jAv-9rhg&s',
    ),
  ];

  static const List<ReciteModel> recite = [
    ReciteModel(
      endPoint: 'maher',
      name: 'ماهر المعيقلي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNFPVopJXu0EhWT8tWFeOL-pswy6ZJZG1Dpw&s',
    ),
    ReciteModel(
      endPoint: 'ar.abdulbasitmujawwad',
      name: 'عبد الباسط عبد الصمد',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMBpW-JH7CACcz6PFC2Nt2MmwOsJouxDBiag&s',
    ),
    ReciteModel(
      endPoint: 'husr',
      name: 'محمود خليل الحصري',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJiSxXeFWpiUKLLdOZ1bFP1q24hk5RLuD9Ow&s',
    ),
    ReciteModel(
      endPoint: 'afs',
      name: 'مشاري راشد العفاسي',
      imgURL: 'https://i1.sndcdn.com/artworks-000088975436-n33pt8-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 'ar.muhammadsiddiqalminshawimujawwad',
      name: 'محمد صديق المنشاوي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQhhTub-NbkWaMsfvXfxMAYC4dAEJnkZiO3g&s',
    ),
    ReciteModel(
      endPoint: 'ar.yasseraldossari',
      name: 'ياسر الدوسري',
      imgURL:
          'https://i1.sndcdn.com/artworks-yqaFIhjTMlyQyFHL-5PmjKw-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 'qtm',
      name: 'ناصر القطامي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh3vbUgHBa_nlQVf575jnemxuWzlqA3Uhqbg&s',
    ),
    ReciteModel(
      endPoint: 'bna',
      name: 'محمود علي البنا',
      imgURL:
          'https://i1.sndcdn.com/artworks-gd2VK9TkQ11WYC4l-66KqcQ-t500x500.jpg',
    ),
    ReciteModel(
      endPoint: 's_gmd',
      name: "سعد الغامدى",
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Go4gG62x0YdT0oWlmIRAvetZgYdTcPC9ug&s',
    ),
    ReciteModel(
      endPoint: 'tblawi',
      name: 'محمد الطبلاوي',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE7pjs099-f_RTosvGtIoGrZe0c2jAv-9rhg&s',
    ),
    ReciteModel(
      endPoint: 'lhdan',
      name: 'محمد اللحيدان',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRibdy9bE-YifVBDsO7bt8j2O1hSmVcqSMGdA&s',
    ),
    ReciteModel(
      endPoint: 'sds',
      name: 'عبدالرحمن السديس',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBnhOnzhSb5dvnQPZwyZiVKzdYKOTbVp4SKA&s',
    ),
  ];

  static const String themeKey = 'themeMode';
  static const String lastRead = 'lastRead';
}
