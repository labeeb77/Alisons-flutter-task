import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
    int? success;
    List<dynamic>? selectedOption;
    String? message;
    Product? product;
    dynamic enableGuestReview;

    ProductDetailsModel({
        this.success,
        this.selectedOption,
        this.message,
        this.product,
        this.enableGuestReview,
    });

    factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
        success: json["success"],
        selectedOption: json["selected_option"] == null ? [] : List<dynamic>.from(json["selected_option"]!.map((x) => x)),
        message: json["message"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        enableGuestReview: json["enable_guest_review"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "selected_option": selectedOption == null ? [] : List<dynamic>.from(selectedOption!.map((x) => x)),
        "message": message,
        "product": product?.toJson(),
        "enable_guest_review": enableGuestReview,
    };
}

class Product {
    String? slug;
    String? code;
    String? sizeChart;
    String? metaTitle;
    String? metaDescription;
    dynamic metaKeywords;
    int? parentId;
    String? name;
    String? description;
    String? appDescription;
    String? storeslug;
    String? store;
    String? manufacturer;
    String? symbolLeft;
    String? symbolRight;
    String? purchaseReward;
    String? rewardPoint;
    String? oldprice;
    String? price;
    String? discount;
    String? rating;
    int? wishlist;
    int? cart;
    int? reviewscount;
    int? ratingcount;
    String? sellerrating;
    List<dynamic>? relatedProducts;
    List<dynamic>? options;
    List<dynamic>? allOptions;
    List<Address>? address;
    List<Image>? images;
    List<StoreElement>? stores;
    List<dynamic>? reviews;
    List<dynamic>? specifications;
    List<dynamic>? allProductOptions;
    List<dynamic>? pOptions;

    Product({
        this.slug,
        this.code,
        this.sizeChart,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.parentId,
        this.name,
        this.description,
        this.appDescription,
        this.storeslug,
        this.store,
        this.manufacturer,
        this.symbolLeft,
        this.symbolRight,
        this.purchaseReward,
        this.rewardPoint,
        this.oldprice,
        this.price,
        this.discount,
        this.rating,
        this.wishlist,
        this.cart,
        this.reviewscount,
        this.ratingcount,
        this.sellerrating,
        this.relatedProducts,
        this.options,
        this.allOptions,
        this.address,
        this.images,
        this.stores,
        this.reviews,
        this.specifications,
        this.allProductOptions,
        this.pOptions,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        slug: json["slug"],
        code: json["code"],
        sizeChart: json["size_chart"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        parentId: json["parent_id"],
        name: json["name"],
        description: json["description"],
        appDescription: json["app_description"],
        storeslug: json["storeslug"],
        store: json["store"],
        manufacturer: json["manufacturer"],
        symbolLeft: json["symbol_left"],
        symbolRight: json["symbol_right"],
        purchaseReward: json["purchase_reward"],
        rewardPoint: json["reward_point"],
        oldprice: json["oldprice"],
        price: json["price"],
        discount: json["discount"],
        rating: json["rating"],
        wishlist: json["wishlist"],
        cart: json["cart"],
        reviewscount: json["reviewscount"],
        ratingcount: json["ratingcount"],
        sellerrating: json["sellerrating"],
        relatedProducts: json["related_products"] == null ? [] : List<dynamic>.from(json["related_products"]!.map((x) => x)),
        options: json["options"] == null ? [] : List<dynamic>.from(json["options"]!.map((x) => x)),
        allOptions: json["all_options"] == null ? [] : List<dynamic>.from(json["all_options"]!.map((x) => x)),
        address: json["address"] == null ? [] : List<Address>.from(json["address"]!.map((x) => Address.fromJson(x))),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        stores: json["stores"] == null ? [] : List<StoreElement>.from(json["stores"]!.map((x) => StoreElement.fromJson(x))),
        reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        specifications: json["specifications"] == null ? [] : List<dynamic>.from(json["specifications"]!.map((x) => x)),
        allProductOptions: json["all_product_options"] == null ? [] : List<dynamic>.from(json["all_product_options"]!.map((x) => x)),
        pOptions: json["p_options"] == null ? [] : List<dynamic>.from(json["p_options"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "code": code,
        "size_chart": sizeChart,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "parent_id": parentId,
        "name": name,
        "description": description,
        "app_description": appDescription,
        "storeslug": storeslug,
        "store": store,
        "manufacturer": manufacturer,
        "symbol_left": symbolLeft,
        "symbol_right": symbolRight,
        "purchase_reward": purchaseReward,
        "reward_point": rewardPoint,
        "oldprice": oldprice,
        "price": price,
        "discount": discount,
        "rating": rating,
        "wishlist": wishlist,
        "cart": cart,
        "reviewscount": reviewscount,
        "ratingcount": ratingcount,
        "sellerrating": sellerrating,
        "related_products": relatedProducts == null ? [] : List<dynamic>.from(relatedProducts!.map((x) => x)),
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "all_options": allOptions == null ? [] : List<dynamic>.from(allOptions!.map((x) => x)),
        "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "specifications": specifications == null ? [] : List<dynamic>.from(specifications!.map((x) => x)),
        "all_product_options": allProductOptions == null ? [] : List<dynamic>.from(allProductOptions!.map((x) => x)),
        "p_options": pOptions == null ? [] : List<dynamic>.from(pOptions!.map((x) => x)),
    };
}

class Address {
    int? id;
    int? customerId;
    String? name;
    dynamic address;
    String? buildingNumber;
    String? areaNumber;
    dynamic streetNumber;
    String? city;
    String? region;
    String? state;
    int? countryId;
    String? zipcode;
    String? mobile;
    String? addressType;
    dynamic latitude;
    dynamic longtitude;
    int? isDefault;
    DateTime? createdAt;
    DateTime? updatedAt;
    Country? country;

    Address({
        this.id,
        this.customerId,
        this.name,
        this.address,
        this.buildingNumber,
        this.areaNumber,
        this.streetNumber,
        this.city,
        this.region,
        this.state,
        this.countryId,
        this.zipcode,
        this.mobile,
        this.addressType,
        this.latitude,
        this.longtitude,
        this.isDefault,
        this.createdAt,
        this.updatedAt,
        this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        address: json["address"],
        buildingNumber: json["building_number"],
        areaNumber: json["area_number"],
        streetNumber: json["street_number"],
        city: json["city"],
        region: json["region"],
        state: json["state"],
        countryId: json["country_id"],
        zipcode: json["zipcode"],
        mobile: json["mobile"],
        addressType: json["address_type"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "address": address,
        "building_number": buildingNumber,
        "area_number": areaNumber,
        "street_number": streetNumber,
        "city": city,
        "region": region,
        "state": state,
        "country_id": countryId,
        "zipcode": zipcode,
        "mobile": mobile,
        "address_type": addressType,
        "latitude": latitude,
        "longtitude": longtitude,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "country": country?.toJson(),
    };
}

class Country {
    int? id;
    String? name;
    String? shortcode;
    int? dialCode;
    int? deliveryAvailable;
    dynamic createdAt;
    DateTime? updatedAt;

    Country({
        this.id,
        this.name,
        this.shortcode,
        this.dialCode,
        this.deliveryAvailable,
        this.createdAt,
        this.updatedAt,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        shortcode: json["shortcode"],
        dialCode: json["dial_code"],
        deliveryAvailable: json["delivery_available"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortcode": shortcode,
        "dial_code": dialCode,
        "delivery_available": deliveryAvailable,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Image {
    int? id;
    String? image;
    int? isDefault;

    Image({
        this.id,
        this.image,
        this.isDefault,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        isDefault: json["is_default"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "is_default": isDefault,
    };
}

class StoreElement {
    int? id;
    int? productId;
    int? storeId;
    String? defaultPrice;
    String? stock;
    String? minQuantity;
    String? maxQuantity;
    String? currentPrice;
    String? cost;
    int? returnPeriod;
    int? status;
    String? commission;
    int? stockAlertQuantity;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? price;
    String? rating;
    StoreStore? store;

    StoreElement({
        this.id,
        this.productId,
        this.storeId,
        this.defaultPrice,
        this.stock,
        this.minQuantity,
        this.maxQuantity,
        this.currentPrice,
        this.cost,
        this.returnPeriod,
        this.status,
        this.commission,
        this.stockAlertQuantity,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.rating,
        this.store,
    });

    factory StoreElement.fromJson(Map<String, dynamic> json) => StoreElement(
        id: json["id"],
        productId: json["product_id"],
        storeId: json["store_id"],
        defaultPrice: json["default_price"],
        stock: json["stock"],
        minQuantity: json["min_quantity"],
        maxQuantity: json["max_quantity"],
        currentPrice: json["current_price"],
        cost: json["cost"],
        returnPeriod: json["return_period"],
        status: json["status"],
        commission: json["commission"],
        stockAlertQuantity: json["stock_alert_quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        price: json["price"],
        rating: json["rating"],
        store: json["store"] == null ? null : StoreStore.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "store_id": storeId,
        "default_price": defaultPrice,
        "stock": stock,
        "min_quantity": minQuantity,
        "max_quantity": maxQuantity,
        "current_price": currentPrice,
        "cost": cost,
        "return_period": returnPeriod,
        "status": status,
        "commission": commission,
        "stock_alert_quantity": stockAlertQuantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "price": price,
        "rating": rating,
        "store": store?.toJson(),
    };
}

class StoreStore {
    int? id;
    String? name;
    String? address;
    String? slug;
    String? latitude;
    String? longtitude;
    String? image;
    String? phoneNumber;

    StoreStore({
        this.id,
        this.name,
        this.address,
        this.slug,
        this.latitude,
        this.longtitude,
        this.image,
        this.phoneNumber,
    });

    factory StoreStore.fromJson(Map<String, dynamic> json) => StoreStore(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        slug: json["slug"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        image: json["image"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "slug": slug,
        "latitude": latitude,
        "longtitude": longtitude,
        "image": image,
        "phone_number": phoneNumber,
    };
}
