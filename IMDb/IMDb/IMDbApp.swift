//
//  IMDbApp.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

@main
struct IMDbApp: App {
    var body: some Scene {
        WindowGroup {
            MoViewListView()
                .environment(\.colorScheme, .dark)
        }
    }
}
