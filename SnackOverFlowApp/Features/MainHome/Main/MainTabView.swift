//
//  MainTabView.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ForEach(HomeTabItem.tabItems) {
                item in
                item.page
                    .tabItem {
                        TabIconLabel(model: item.model)

                    }
            }
        }
    }
}

#Preview {
    MainTabView()
}

private struct TabIconLabel: View {
    let model: TabModel
    var body: some View {
        VStack {
            Image(model.icon.toIconName())
            Text(model.title.rawValue.locale())
        }
    }
}
