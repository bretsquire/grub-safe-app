//
//  Constants.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/22/22.
//

import Foundation
import UIKit

enum Constants {
    enum Api {
        public static let endpoint = "http://foodbukka.herokuapp.com/api/v1/"
        public static let menuPath = "menu"
    }
    enum SFSymbols {
        public static let checkmark = "checkmark"
        public static let circle = "circle"
        public static let questionmark = "person.crop.circle.badge.questionmark.fill"
        public static let addToOrder = "bag.fill.badge.plus"
    }
    
    enum Onboarding {
        public static let dismissHandleOpacity = 0.15
        public static let dismissHandleWidth = CGFloat(35)
        public static let dismissHandleHeight = CGFloat(5)
        public static let dismissHandleTopPadding = CGFloat(5)
        public static let rowsTopPadding = CGFloat(1)
        public static let descriptionHorizontalPadding = CGFloat(5)
    }
    enum Menu {
        public static let rowsTopPadding = CGFloat(0.1)
        public static let horizontalPadding = CGFloat(5)
        public static let splashScreenDuration = 5.0
    }
}
