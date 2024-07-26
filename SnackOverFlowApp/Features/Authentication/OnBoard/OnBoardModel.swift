//
//  OnBoardModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 21.07.2024.
//

import Foundation

struct OnBoardModel: Identifiable {
    let id: Int
    let imageName: String
    let description: String

    static let items: [OnBoardModel] = [

        OnBoardModel(
            id:0,
            imageName: Images.handpick.toName(),
            description: LocaleKeys.OnBoard.contentFirst.rawValue
        ),
        OnBoardModel(
            id:1,
            imageName: Images.shop.toName(),
            description: LocaleKeys.OnBoard.contentSecond.rawValue
        ),
        OnBoardModel(
            id:2,
            imageName: Images.deliver.toName(),
            description: LocaleKeys.OnBoard.contentThird.rawValue
        ),

    ]

}
