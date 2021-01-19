//
//  iDineApp.swift
//  iDine
//
//  Created by Pushpinder Pal Singh on 10/12/20.
//

import SwiftUI

@main
struct iDineApp: App {
    var body: some Scene {
        WindowGroup {
            let order = Order()
            AppView().environmentObject(order)
        }
    }
}
