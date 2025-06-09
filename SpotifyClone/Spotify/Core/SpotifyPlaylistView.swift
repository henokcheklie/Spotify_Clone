//
//  SpotifyPlayListView.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 01/03/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user :User = .mock
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
    @State private var offset: CGFloat = 0
    
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView( .vertical){
                LazyVStack(spacing: 12 ){
                    PlaylistHeaderCell(
                        height: 300,
                        title: product.title,
                        subtitle: product.brand?.capitalized ?? product.category.rawValue.capitalized,
                        imageName:product.thumbnail
                    )
                    .readingFrame{ frame in
                        offset = frame.maxY
                        showHeader = frame.maxY < 150
                    }
                    PlaylistDescriptionCell(
                        userName: user.firstName,
                        descriptionText: product.description,
                        subheadline: product.category.rawValue.capitalized,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onMorePressed: nil,
                        onShelfPressed:nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal , 16)
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {goToPlaylistView(product: product)},
                            onElipsisPressed:{ }
                        ).padding(.leading, 16)
                    }
                }
            }.scrollIndicators(.hidden)
            
            ZStack{
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth:.infinity)
                    .background(Color.spotifyBlack)
                    .opacity(showHeader ? 1 : 0)
                    .offset(y: showHeader ? 0 : -40)
                Image(systemName: "chevron.left")
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                    .clipShape(.circle)
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                       
            }
            
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxHeight: .infinity, alignment: .top)
            
        }.task {
            await getData()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    private func goToPlaylistView(product:Product){
     
        router.showScreen(.push){ _ in
            SpotifyPlaylistView(product: product, user: user)
        }

    }
    
    private func getData() async{
        do {
            products =  try await DatabaseHelper().getProducts()
        }catch{
            
        }
    }
}

#Preview {
    RouterView{_ in
        SpotifyPlaylistView()
    }
}
