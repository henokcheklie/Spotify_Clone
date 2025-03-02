//
//  SpotifyPlayListView.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 01/03/2025.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    var user :User = .mock
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
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
