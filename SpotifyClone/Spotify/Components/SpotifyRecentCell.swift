//
//  SpotifyRecentCell.swift
//  FirstSwiftApp
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import SwiftUI


struct SpotifyRecentCell: View {
    var imageUrl: String = Constants.randomImage
    var isSelected: Bool = false
    var title: String = "Image Title"
    var body: some View{
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageUrl).frame(width: 55, height: 55)
            Text(title).font(.callout).fontWeight(.semibold).lineLimit(2).padding(.trailing, 8)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .themeColor(isSelected:false).cornerRadius(6)
    }}

#Preview(){
    ZStack{
        VStack{
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
        
    }.padding(.horizontal,8)
}
