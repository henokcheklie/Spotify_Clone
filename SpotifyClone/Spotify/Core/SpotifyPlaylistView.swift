//
//  SpotifyPlayListView.swift
//  SpotifyClone
//
//  Created by APPLE on 01/03/2025.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
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
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
