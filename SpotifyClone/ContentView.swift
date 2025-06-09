//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
   
    var body: some View {
        List {
            Button("Go to Home") {
                router.showScreen(.fullScreenCover){ _ in
                    SpotifyHomeView()
                }
             
            }
            
        }
    }
        
    
    }

#Preview {
    RouterView {_ in
        ContentView()
    }
  }





    //        ScrollView{
    //            VStack {
    //                if users.isEmpty {
    //                                   Text("No user available")
    //                        .foregroundColor(.gray).bold()
    //                               } else {
    //                ForEach(users)  { user in
    //                    Text(user.firstName)
    //              }
    //            }
    //          }
    //        }
    //            .padding()
    //            .task {
    //                await getData()
    //            }
    //    
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
