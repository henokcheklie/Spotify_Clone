//
//  SpotifyHomeView.swift
//  FirstSwiftApp
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    @State private var currectUser:  User? = nil
    @State private var selectedcategory:  Category? = nil
    @State private var products: [Product] = []
    @State private var productRow: [ProductRow] = []
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(
                    spacing: 1,
                    pinnedViews: [.sectionHeaders],
                    content:{
                        Section{
                            VStack(spacing: 16){
                                RecentsSection.padding(.horizontal,16)
                                if let product = products.first{
                                    NewReleaseSection(product:   product).padding(.horizontal,16)
                                }
                                ListRowSection
                            }
                    
                        } header: {
                            Header
                        }
                    }).padding(.top, 8)
                
                
            }.scrollIndicators(.hidden).clipped()
        }.task {
            await  getData()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    
    

    
    private var RecentsSection:some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10,  items: products) { product in
            if let product {
                SpotifyRecentCell(imageUrl: product.firstImage, title: product.title
                ).asButton (.press){
                    
                }
            }
        }
    }
    
    private var ListRowSection:  some View{
        
        ForEach(productRow){row in
            VStack(spacing:8){
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal){
                    HStack(alignment:.top, spacing: 16){
                        ForEach(row.products){ product in
                            ImageTitleRowCell(
                                imageSize:120,
                                imageName: product.firstImage,
                                title: product.title)
                                .asButton (.press){
                                    
                                }
                        }
                        
                    }.padding(.horizontal, 16)
                }.scrollIndicators(.hidden)
            }
        }
    }
    
private func NewReleaseSection (product: Product) -> some View {
        return   SpotifyNewReleaseSection(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category.rawValue,
            tiltle: product.title,
            subtitle:product.description,
            onAddButtonPressed: {
    
            },
            onPlayButtonPressed: {
                
            }
        )
}
    
private var Header: some View{
        
        /////// user profile wiew
        HStack(spacing:0){
            ZStack{
                if let currectUser {
                    ImageLoaderView(urlString: currectUser.image).background(.spotifyWhite).clipShape(Circle()).onTapGesture {
                        
                    }
                }
            }.frame(width: 35, height: 35)
            ///// horizontal scroll view
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self){category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedcategory).onTapGesture{
                            selectedcategory = category
                        }
                    }
                }.padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }.padding(.vertical, 24).padding(.leading, 8).background(.spotifyBlack)
    }

private func getData() async{
    do {
        currectUser = try await DatabaseHelper().getUsers().first
        products =  try await Array( DatabaseHelper().getProducts().prefix(8))
        
        
        var rows :[ProductRow] = []
        let allBrands = Set(products.map({ $0.brand }))
        for brand in allBrands {
            //                let products = self.products.filter({ $0.brand == brand }) //filter products based on their brand
            rows.append(ProductRow( title:(brand ?? "Explore").capitalized, products: products))
            
            
        }
        productRow = rows
        
    }catch{
        
    }
  }
}

#Preview {
    SpotifyHomeView()
}
