//
//  OnBoardView.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 21.07.2024.
//

import SwiftUI

struct OnBoardView: View {

    @StateObject var onBoardVM: OnBoardViewModel = OnBoardViewModel()
    @StateObject var navManager = NavigationManager()
    private let screenSize: CGSize = GlobalScreenSize.size

    init() {
        onBoardVM.chechUserFirstTime()
    }

    var body: some View {
        NavigationStack(path: $navManager.path) {
            VStack {
                Spacer()
                TabView(
                    selection: $onBoardVM.currentIndex,
                    content: {
                        ForEach(OnBoardModel.items, id: \.id) { value in
                            TabViewItem(
                                model: value,
                                imageHeight: screenSize.dynamicHeight(height: 0.5)
                            )
                        }
                    }
                )
                .tabViewStyle(.page(indexDisplayMode: .never))
                IndexDivider(currentIndex: $onBoardVM.currentIndex)

                OnBoardButton {
                    onBoardVM.saveUserLoginAndRedirect()
                }

                .padding(.top, screenSize.dynamicHeight(height: 0.02))

            }
            .modifier(SafePaddingModifier())
            .navigationDestination(isPresented: $onBoardVM.isHomeRedirect) {
                LoginView()
                    .toolbar(.hidden, for: .automatic)
                    .ignoresSafeArea(.all)

            }
            .onAppear {
                onBoardVM.chechUserFirstTime()
            }
            .onDisappear {
                onBoardVM.changeIsHomeRedirect(value: true)
            }
        }
    }
}

#Preview {
    OnBoardView()
    //        .ignoresSafeArea(.all)
}

private struct RoundedRectangleView: View {
    let width: Double
    var body: some View {
        Rectangle()
            .clipShape(
                RoundedRectangle(
                    cornerRadius: RadiusItems.radius
                )
            )
            .foregroundStyle(.cClooney)
            .frame(width: width)
    }
}

private struct TabViewItem: View {

    let model: OnBoardModel
    let imageHeight: Double

    var body: some View {

        VStack {
            Image(model.imageName)
                .resizable()
                .frame(height: imageHeight)
            Text(model.description.locale())
                .font(.title3)
                .fontWeight(.semibold)
                //                .font(.system(size: FontSizes.largeTitle, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.cPeach)

        }
    }
}

struct IndexDivider: View {
    private let screenSize: CGSize = GlobalScreenSize.size
    var currentIndex: Binding<Int>
    var body: some View {
        HStack {
            ForEach((0...2), id: \.self) { index in
                if index == currentIndex.wrappedValue {
                    RoundedRectangleView(width: screenSize.dynamicWidth(width: 0.08))
                }
                else {
                    RoundedRectangleView(width: screenSize.dynamicWidth(width: 0.05))
                }

            }
        }
        .frame(height: screenSize.dynamicHeight(height: 0.01))
    }
}
