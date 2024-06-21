class BuilderResponse {
  String? appName;
  String? companyName;
  String? appSsImage;
  String? appStoreLink;
  List<ClientTestimonial>? clientTestimonials;
  String? playStoreLink;
  List<WhyChooseUs>? whyChooseUs;
  OurMission? ourMission;
  String? siteDescription;
  String? helpAndSupportUrl;
  String? contactEmail;
  String? contactNumber;
  String? twitterUrl;
  String? facebookUrl;
  String? instagramUrl;
  String? linkedInUrl;
  String? copyrightText;
  String? privacyPolicy;
  String? termAndCondition;

  BuilderResponse({
    this.appName,
    this.companyName,
    this.appSsImage,
    this.appStoreLink,
    this.clientTestimonials,
    this.playStoreLink,
    this.whyChooseUs,
    this.ourMission,
    this.siteDescription,
    this.helpAndSupportUrl,
    this.contactEmail,
    this.contactNumber,
    this.twitterUrl,
    this.facebookUrl,
    this.instagramUrl,
    this.linkedInUrl,
    this.copyrightText,
    this.privacyPolicy,
    this.termAndCondition,
  });

  factory BuilderResponse.fromJson(Map<String, dynamic> json) {
    return BuilderResponse(
      appName: json['app_name'],
      companyName: json['company_name'],
      appSsImage: json['app_ss_image'],
      appStoreLink: json['app_store_link'],
      clientTestimonials: json['client_testimonials'] != null ? (json['client_testimonials'] as List).map((i) => ClientTestimonial.fromJson(i)).toList() : null,
      playStoreLink: json['play_store_link'],
      whyChooseUs: json['why_choose_us'] != null ? (json['why_choose_us'] as List).map((i) => WhyChooseUs.fromJson(i)).toList() : null,
      ourMission: json['our_mission'] != null ? new OurMission.fromJson(json['our_mission']) : null,
      siteDescription: json['siteDescription'],
      helpAndSupportUrl: json['helpAndSupportUrl'],
      contactEmail: json['contactEmail'],
      contactNumber: json['contactNumber'],
      twitterUrl: json['twitterUrl'],
      facebookUrl: json['facebookUrl'],
      instagramUrl: json['instagramUrl'],
      linkedInUrl: json['linkedInUrl'],
      copyrightText: json['copyrightText'],
      privacyPolicy: json['privacyPolicy'],
      termAndCondition: json['termAndCondition'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['company_name'] = this.companyName;
    data['app_ss_image'] = this.appSsImage;
    data['app_store_link'] = this.appStoreLink;
    data['play_store_link'] = this.playStoreLink;
    if (this.clientTestimonials != null) {
      data['client_testimonials'] = this.clientTestimonials!.map((v) => v.toJson()).toList();
    }
    if (this.whyChooseUs != null) {
      data['why_choose_us'] = this.whyChooseUs!.map((v) => v.toJson()).toList();
    }
    if (this.ourMission != null) {
      data['our_mission'] = this.ourMission!.toJson();
    }
    if (siteDescription != null) {
      data['siteDescription'] = this.siteDescription;
    }
    if (helpAndSupportUrl != null) {
      data['helpAndSupportUrl'] = this.helpAndSupportUrl;
    }
    if (contactEmail != null) {
      data['contactEmail'] = this.contactEmail;
    }
    if (contactNumber != null) {
      data['contactNumber'] = this.contactNumber;
    }
    if (twitterUrl != null) {
      data['twitterUrl'] = this.twitterUrl;
    }
    if (facebookUrl != null) {
      data['facebookUrl'] = this.facebookUrl;
    }
    if (instagramUrl != null) {
      data['instagramUrl'] = this.instagramUrl;
    }
    if (linkedInUrl != null) {
      data['linkedInUrl'] = this.linkedInUrl;
    }
    if (copyrightText != null) {
      data['copyrightText'] = this.copyrightText;
    }
    if (privacyPolicy != null) {
      data['privacyPolicy'] = this.privacyPolicy;
    }
    if (termAndCondition != null) {
      data['termAndCondition'] = this.termAndCondition;
    }
    return data;
  }
}

class OurMission {
  String? image;
  String? description;

  OurMission({this.image, this.description});

  OurMission.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

class WhyChooseUs {
  String? image;
  String? subtitle;
  String? title;
  bool isMore;

  WhyChooseUs({this.image, this.subtitle, this.title, this.isMore = false});

  factory WhyChooseUs.fromJson(Map<String, dynamic> json) {
    return WhyChooseUs(
      image: json['image'],
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    return data;
  }
}

class ClientTestimonial {
  String? description;
  String? name;
  String? profileImage;
  String? type;

  ClientTestimonial({this.description, this.name, this.profileImage, this.type});

  factory ClientTestimonial.fromJson(Map<String, dynamic> json) {
    return ClientTestimonial(
      description: json['description'],
      name: json['name'],
      profileImage: json['profile_image'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['type'] = this.type;
    return data;
  }
}
