//
//  NavBarBackButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 26.07.2024.
//

import Foundation
import SwiftUI

struct NavBarBackButton<Destination: View>: View {
    let destination: Destination
    var body: some View {
        NavigationLink(destination: {
            destination
                .toolbar(.hidden, for: .automatic)
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }
}
