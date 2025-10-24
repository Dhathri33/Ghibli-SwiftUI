//
//  AppearanceTheme.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//

import Foundation

enum AppearanceTheme: String, CaseIterable ,Identifiable {
    var id: Self { return self }
    case system
    case light
    case dark
}

enum UserDefaultsKeys {
    static let appearanceTheme = "appearanceTheme"
    static let username = "username"
    static let itemsPerPage = "itemsPerPage"
    static let notificationsEnabled = "notificationsEnabled"
}
