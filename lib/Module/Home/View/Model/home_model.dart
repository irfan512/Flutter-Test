// To parse this JSON data, do
//
//     final homePostModel = homePostModelFromJson(jsonString);


class HomePostModel {
  int? postId;
  int? userId;
  int? typeId;
  int? payType;
  int? price;
  dynamic currency;
  int? status;
  dynamic website;
  int? isPromote;
  int? promotDuration;
  dynamic campaignType;
  dynamic campDate;
  dynamic campTime;
  dynamic description;
  dynamic postVideo;
  dynamic hashtags;
  dynamic hashtagTitles;
  dynamic postType;
  String? profileImage;
  dynamic name;
  int? countryId;
  dynamic country;
  dynamic flag;
  dynamic currencyFlag;
  int? laqtaCoins;
  dynamic postTitle;
  int? displaySaltaries;
  dynamic content;
  List<PostImage>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  dynamic type;
  // List<dynamic>? survey;

  HomePostModel({
    this.postId,
    this.userId,
    this.typeId,
    this.payType,
    this.price,
    this.currency,
    this.status,
    this.website,
    this.isPromote,
    this.promotDuration,
    this.campaignType,
    this.campDate,
    this.campTime,
    this.description,
    this.postVideo,
    this.hashtags,
    this.hashtagTitles,
    this.postType,
    this.profileImage,
    this.name,
    this.countryId,
    this.country,
    this.flag,
    this.currencyFlag,
    this.laqtaCoins,
    this.postTitle,
    this.displaySaltaries,
    this.content,
    this.images,
    this.likes,
    this.shares,
    this.comments,
    this.offers,
    this.type,
    // this.survey,
  });

  factory HomePostModel.fromJson(Map<String, dynamic> json) {
    return HomePostModel(
      postId: json['post_id'],
      userId: json['user_id'],
      typeId: json['type_id'],
      payType: json['pay_type'],
      price: json['price'],
      currency: json['currency'],
      status: json['status'],
      website: json['website'],
      isPromote: json['is_promote'],
      promotDuration: json['promot_duration'],
      campaignType: json['campaign_type'],
      campDate: json['camp_date'],
      campTime: json['camp_time'],
      description: json['description'],
      postVideo: json['post_video'],
      hashtags: json['hashtags'],
      hashtagTitles: json['hashtag_titles'],
      postType: json['post_type'],
      profileImage: json['profile_image'],
      name: json['name'],
      countryId: json['country_id'],
      country: json['country'],
      flag: json['flag'],
      currencyFlag: json['currency_flag'],
      laqtaCoins: json['laqta_coins'],
      postTitle: json['post_title'],
      displaySaltaries: json['display_saltaries'],
      content: json['content'],
      images: List<PostImage>.from(json['images'].map((x) => PostImage.fromJson(x))),
      likes: json['likes'],
      shares: json['shares'],
      comments: json['comments'],
      offers: json['offers'],
      type: json['type'],
      // survey: List<dynamic>.from(json['survey'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'user_id': userId,
      'type_id': typeId,
      'pay_type': payType,
      'price': price,
      'currency': currency,
      'status': status,
      'website': website,
      'is_promote': isPromote,
      'promot_duration': promotDuration,
      'campaign_type': campaignType,
      'camp_date': campDate,
      'camp_time': campTime,
      'description': description,
      'post_video': postVideo,
      'hashtags': hashtags,
      'hashtag_titles': hashtagTitles,
      'post_type': postType,
      'profile_image': profileImage,
      'name': name,
      'country_id': countryId,
      'country': country,
      'flag': flag,
      'currency_flag': currencyFlag,
      'laqta_coins': laqtaCoins,
      'post_title': postTitle,
      'display_saltaries': displaySaltaries,
      'content': content,
      'images': images?.map((image) => image.toJson()).toList(),
      'likes': likes,
      'shares': shares,
      'comments': comments,
      'offers': offers,
      'type': type,
      // 'survey': survey,
    };
  }
}


class PostImage {
  String? image;
  int? isFirstPic;

  PostImage({
    this.image,
    this.isFirstPic,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) {
    return PostImage(
      image: json['image'],
      isFirstPic: json['is_first_pic'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'is_first_pic': isFirstPic,
    };
  }
}
