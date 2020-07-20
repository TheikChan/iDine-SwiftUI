//
//  OrderView.swift
//  iDine
//
//  Created by DaewiChan on 7/20/20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$ \(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }.navigationBarTitle("Order").listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offset: IndexSet)  {
        order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
