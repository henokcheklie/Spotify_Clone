//
//  Product.swift
//  FirstSwiftApp
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import Foundation


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct ProductRow: Identifiable {
    let id: String = UUID().uuidString
    let title : String
    let products: [Product]
}
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: ProductCategory
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    var firstImage: String{
        images.first ?? Constants.randomImage
    }
    static var mock: Product{
        Product(id: 1,
                title: "Essence Mascara Lash Princess",
                description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                category: SpotifyClone.ProductCategory.beauty,
                price: 9.99, discountPercentage: 7.17,
                rating: 4.94,
                stock: 5,
                tags: ["beauty", "mascara"],
                brand: Optional("Essence"),
                sku: "RCH45Q1A", weight: 2,
                dimensions: SpotifyClone.Dimensions(width: 23.17, height: 14.43, depth: 28.01),
                warrantyInformation: "1 month warranty",
                shippingInformation: "Ships in 1 month",
                availabilityStatus: SpotifyClone.AvailabilityStatus.lowStock,
                reviews: [SpotifyClone.Review(rating: 2, comment: "Very unhappy with my purchase!", date: SpotifyClone.CreatedAt.the20240523T085621618Z, reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com"), SpotifyClone.Review(rating: 2, comment: "Not as described!", date: SpotifyClone.CreatedAt.the20240523T085621618Z, reviewerName: "Nolan Gonzalez", reviewerEmail: "nolan.gonzalez@x.dummyjson.com"), SpotifyClone.Review(rating: 5, comment: "Very satisfied!", date: SpotifyClone.CreatedAt.the20240523T085621618Z, reviewerName: "Scarlett Wright", reviewerEmail: "scarlett.wright@x.dummyjson.com")],
                returnPolicy: SpotifyClone.ReturnPolicy.the30DaysReturnPolicy,
                minimumOrderQuantity: 24,
                meta: SpotifyClone.Meta(createdAt: SpotifyClone.CreatedAt.the20240523T085621618Z, updatedAt: SpotifyClone.CreatedAt.the20240523T085621618Z, barcode: "9164035109868", qrCode: "https://assets.dummyjson.com/public/qr-code.png"),
                images: ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
                thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png")
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum ProductCategory: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}
