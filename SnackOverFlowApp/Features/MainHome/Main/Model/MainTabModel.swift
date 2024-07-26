//
//  MainTabModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import Foundation
import SwiftUI

struct HomeTabItem: Identifiable {
    let id: UUID = UUID()
    let page: AnyView
    let model: TabModel

    static let tabItems: [HomeTabItem] = [
        HomeTabItem(page: AnyView(HomeView()), model: TabModel(title: .home, icon: .home)),
        HomeTabItem(page: AnyView(MarketView()), model: TabModel(title: .market, icon: .market)),
        HomeTabItem(page: AnyView(CreateView()), model: TabModel(title: .create, icon: .create)),
        HomeTabItem(
            page: AnyView(WishlistView()),
            model: TabModel(title: .wishlist, icon: .favourite)
        ),
        HomeTabItem(page: AnyView(AccountView()), model: TabModel(title: .account, icon: .person)),
    ]
}

struct TabModel {

    let title: LocaleKeys.Tab
    let icon: Icons.Tabs
}
