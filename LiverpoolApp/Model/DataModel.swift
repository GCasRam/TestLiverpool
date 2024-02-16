//
//  DataModel.swift
//  LiverpoolApp
//
//  Created by Gil CasRam on 15/02/24.
//

import Foundation
import Combine

struct Product: Codable {
    let moreLinkCategory         : String?
    let minNumRecords            : Int?
    let maximumNumRecords        : Int?
    let name                     : String?
    let recommendedItems         : [RecommendedItems]?
}

struct RecommendedItems: Identifiable, Codable {
    var id = UUID()
    let displayName              : String?
    let largeImage               : String?
    let productId                : String?
    let listPrice                : Double?
    let promoPrice               : Double?
    let salePrice                : Double?
    let groupType                : String?
    let isMarketPlace            : Bool?
    let brand                    : String?
    let seller                   : String?
    let category                 : String?
    let minimumListPrice         : Double?
    let maximumListPrice         : Double?
    let minimumPromoPrice        : Double?
    let maximumPromoPrice        : Double?
    let variantsInfo             : [VariantsInfo]?
}
struct VariantsInfo: Codable {
    let sku                      : String?
    let color                    : String?
    let colorAux                 : String?
    let colorHex                 : String?
    let promoPrice               : Double?
    let listPrice                : Double?
    let salePrice                : Double?
    let images                   : Imagenes?
//    let liverpoolPromotions      : [String]
//    let otherPromotions          : [String]
//    let specialPromotions        : [String]
    let sellersCount             : Int?
    let enableTryOn              : Bool?
//    let scVariantsData           : [String]
    let sizeSequence             : String?
    let hasHybridSeller          : Bool?
    let hasValidOnlineInventory  : Bool?
//    let inventory                : [String]
}

struct Imagenes: Codable {
    let xl                       : String?
    let lg                       : String?
    let sm                       : String?
    let galleryImages            : [String]?
}

struct Banner: Codable {
    let bannerType               : String?
    let bannerItem               : [BannerItem]?
}

struct BannerItem: Codable {
    let redirectsTo              : String?
    let image                    : String?
    let type                     : String?
    let title                    : String?
    let campaign                 : String?
    let view                     : String?
    let position                 : String?
}

struct NullPageContent: Codable {
    let carouselContent          : [Product]?
    let bannerContent            : [BannerItem]?
}

struct ApiResponse: Codable {
    let status                   : Status?
    let pageType                 : String?
    let plpResults               : PlpResults?
    let nullSearch               : Bool?
    let nullPageContent          : [NullPageContent]?
}

struct Status: Codable {
    let status                   : String?
    let statusCode               : Int?
}

struct PlpResults: Codable {
    let label                    : String?
    let plpState                 : PlpState?
    let sortOptions              : [SortOptions]?
    let refinementGroups         : [RefinementGroups]?
    let records                  : [String]
    let navigation               : Navigation?
//    let customUrlParam         : {}
    let metaData                 : MetaData
    let redirectTo404            : Bool?
    let enableMinNumOfPieces     : Bool?
}

struct MetaData: Codable {
    let searchAttributionToken: String
    let cached: Bool
    let totalTime: Int
    }
struct Records: Codable {
let productId: String?
let skuRepositoryId: String?
let productDisplayName: String?
let productType: String?
    let productRatingCount: Double
    let productAvgRating: Double
let promotionalGiftMessage: String?
    let listPrice: Double
    let minimumListPrice: Double
    let maximumListPrice: Double
    let promoPrice: Double
    let minimumPromoPrice: Double
    let maximumPromoPrice: Double
    let isHybrid: Bool
    let isMarketPlace: Bool
    let isImportationProduct: Bool
let brand: String?
let seller: String?
let category: String?
    let dwPromotionInfo: DwPromotionInfo?
let categoryBreadCrumbs: [String]?
let smImage: String?
let lgImage: String?
let xlImage: String?
let groupType: String?
//    let plpFlags:
let variantsColor: [VariantsColor]
let enableTryOn: Bool?
}
struct DwPromotionInfo: Codable{
    let dwToolTipInfo: String?
    let dWPromoDescription: String?
}

struct VariantsColor: Codable {
    let colorName: String?
    let colorHex: String?
    let colorImageURL: String?
    let colorMainURL: String?
    let skuId: String?
}

struct SortOptions: Codable {
    let sortBy: String
    let label: String
}
struct RefinementGroups: Codable {
    let name: String?
    let refinement: [Refinement]?
    let multiSelect: Bool?
    let dimensionName: String
    let moreRefinements: Bool
}
struct Refinement: Codable {
    let count: Int
    let label: String
    let refinementId: String
    let selected: Bool
    let type: String
    let searchName: String
}

struct PlpState: Codable {
    let currentFilters           : String?
    let firstRecNum              : Int?
    let lastRecNum               : Int?
    let recsPerPage              : Int?
    let totalNumRecs             : Int?
    let originalSearchTerm       : String?
    let area                     : String?
    let categoryId               : String?
    let plpSellerName: String
    let currentSortOption: String?
    let id               : String?
}
struct Navigation: Codable {
    let ancester                 : [String]?
    let current                  : [Current]?
//    let childs                   : <Any>
}

struct Ancester: Codable {
    let label: String?
    let categoryId: String?
}

struct Current: Codable {
    var label                    : String?
    var categoryId               : String?
}




