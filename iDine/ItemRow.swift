//
//  ItemRow.swift
//  iDine
//
//  Created by DaewiChan on 7/20/20.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple,"G": .black,"S": .blue,"V": .green]
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)){
            HStack{
                Image(item.thumbnailImage).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.gray,lineWidth: 2))
                VStack(alignment: .leading){
                    Text(item.name).font(.headline)
                    Text("$ \(item.price)")
                }
                Spacer()
                ForEach(item.restrictions,id: \.self){restriction in
                    Text(restriction).font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
