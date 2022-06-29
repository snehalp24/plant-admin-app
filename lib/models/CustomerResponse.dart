import 'package:mighty_plant_admin/models/AttributeModel.dart';

import 'BillingModel.dart';
import 'ShippingModel.dart';

class CustomerResponse {
  String? avatarUrl;
  Billing? billing;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? email;
  String? firstName;
  int? id;
  bool? isPayingCustomer;
  String? lastName;
  Links? links;
  String? role;
  Shipping? shipping;
  String? username;
  List<MetaDataResponse>? metaData;

  CustomerResponse(
      {this.avatarUrl,
      this.metaData,
      this.billing,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.email,
      this.firstName,
      this.id,
      this.isPayingCustomer,
      this.lastName,
      this.links,
      this.role,
      this.shipping,
      this.username});

  factory CustomerResponse.fromJson(Map<String, dynamic> json) {
    return CustomerResponse(
      avatarUrl: json['avatar_url'],
      billing: json['billing'] != null ? Billing.fromJson(json['billing']) : null,
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGmt: json['date_modified_gmt'],
      email: json['email'],
      firstName: json['first_name'],
      id: json['id'],
      isPayingCustomer: json['is_paying_customer'],
      lastName: json['last_name'],
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      role: json['role'],
      shipping: json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null,
      username: json['username'],
      metaData: json['customer_total'] != null ? (json['customer_total'] as List).map((i) => MetaDataResponse.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['is_paying_customer'] = this.isPayingCustomer;
    data['last_name'] = this.lastName;
    data['role'] = this.role;
    data['username'] = this.username;
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetaDataResponse {
  int? id;
  String? key;
  String? value;

  MetaDataResponse({this.id, this.key, this.value});

  MetaDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
