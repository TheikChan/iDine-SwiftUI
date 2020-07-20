//
//  iDineApp.swift
//  iDine
//
//  Created by DaewiChan on 7/20/20.
//

import SwiftUI

@main
struct iDineApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
