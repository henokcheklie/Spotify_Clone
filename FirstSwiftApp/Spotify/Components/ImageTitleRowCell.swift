//
//  ImageTitleRowCell.swift
//  FirstSwiftApp
//
//  Created by APPLE on 28/02/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title:String = "Item Name"
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
                ImageLoaderView(urlString: imageName).frame(width: imageSize, height: imageSize)
                
            Text(title).font(.callout).foregroundStyle(.spotifyLightGray)
                .font(.headline).padding(4).lineLimit(2)
            }.frame(width: imageSize)
        }
       
    }


#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
