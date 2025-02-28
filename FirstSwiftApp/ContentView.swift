//
//  ContentView.swift
//  FirstSwiftApp
//
//  Created by APPLE on 25/02/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var users: [User] = []
    @State private  var products: [Product] = []
    var body: some View {
        ScrollView{
            VStack {
                if users.isEmpty {
                                   Text("No user available")
                        .foregroundColor(.gray).bold()
                               } else {
                ForEach(users)  { user in
                    Text(user.firstName)
              }
            }
          }
        }
            .padding()
            .task {
                await getData()
            }
        }
//    var body: some View {
//        ScrollView{
//            VStack {
//                if products.isEmpty {
//                                   Text("No products available")
//                        .foregroundColor(.gray).bold()
//                               } else {
//                ForEach(products)  { product in
//                    Text(product.title)
//              }
//            }
//          }
//        }
//            .padding()
//            .task {
//                await getData()
//            }
//        }
//    
       

    private func getData() async{
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
        }
    }
}

#Preview {
    ContentView()
  }

