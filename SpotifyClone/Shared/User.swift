//
//  User.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import Foundation


struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let hair: Hair
    let ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    let role: Role

static var mock : User{
    User(
        id: 1,
        firstName: "Emily",
        lastName: "Johnson",
        maidenName: "Smith",
        age: 28,
        gender: SpotifyClone.Gender.female,
        email: "emily.johnson@x.dummyjson.com",
        phone: "+81 965-431-3024",
        username: "emilys",
        password: "emilyspass",
        birthDate: "1996-5-30",
        image: "https://dummyjson.com/icon/emilys/128",
        bloodGroup: "O-",
        height: 193.24,
        weight: 63.16,
        eyeColor: "Green",
        hair: SpotifyClone
            .Hair(
                color: "Brown",
                type: SpotifyClone.TypeEnum.curly
            ),
        ip: "42.48.100.32",
        address: SpotifyClone
            .Address(
                address: "626 Main Street",
                city: "Phoenix",
                state: "Mississippi",
                stateCode: "MS",
                postalCode: "29112",
                coordinates: SpotifyClone.Coordinates(
                    lat: -77.16213,
                    lng: -92.084824
                ),
                country: SpotifyClone.Country.unitedStates
            ),
        macAddress: "47:fa:41:18:ec:eb",
        university: "University of Wisconsin--Madison",
        bank: SpotifyClone
            .Bank(
                cardExpire: "03/26",
                cardNumber: "9289760655481815",
                cardType: "Elo",
                currency: "CNY",
                iban: "YPUXISOBI7TTHPK2BR3HAIXL"
            ),
        company: SpotifyClone
            .Company(
                department: "Engineering",
                name: "Dooley, Kozey and Cronin",
                title: "Sales Manager",
                address: SpotifyClone.Address(
                    address: "263 Tenth Street",
                    city: "San Francisco",
                    state: "Wisconsin",
                    stateCode: "WI",
                    postalCode: "37657",
                    coordinates: SpotifyClone.Coordinates(
                        lat: 71.814525,
                        lng: -161.150263
                    ),
                    country: SpotifyClone.Country.unitedStates
                )
            ),
        ein: "977-175",
        ssn: "900-590-289",
        userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36",
        crypto: SpotifyClone
            .Crypto(
                coin: SpotifyClone.Coin.bitcoin,
                wallet: SpotifyClone.Wallet.the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A,
                network: SpotifyClone.Network.ethereumERC20
            ),
        role: SpotifyClone.Role.admin
    )
}}
// MARK: - Address
struct Address: Codable {
    let address, city, state, stateCode: String
    let postalCode: String
    let coordinates: Coordinates
    let country: Country
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

// MARK: - Company
struct Company: Codable {
    let department, name, title: String
    let address: Address
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin: Coin
    let wallet: Wallet
    let network: Network
}

enum Coin: String, Codable {
    case bitcoin = "Bitcoin"
}

enum Network: String, Codable {
    case ethereumERC20 = "Ethereum (ERC20)"
}

enum Wallet: String, Codable {
    case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Hair
struct Hair: Codable {
    let color: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case curly = "Curly"
    case kinky = "Kinky"
    case straight = "Straight"
    case wavy = "Wavy"
}

enum Role: String, Codable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}
