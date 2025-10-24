//
//  SettingsView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(UserDefaultsKeys.appearanceTheme)
    var appearanceTheme: AppearanceTheme = .system
    
    @AppStorage(UserDefaultsKeys.username)
    var username: String = ""
    
    @AppStorage(UserDefaultsKeys.itemsPerPage)
    var itemsPerPage: Int = 25
    
    @AppStorage(UserDefaultsKeys.notificationsEnabled)
    var notificationsEnabled: Bool = true
    
    var body: some View {
        NavigationStack {
            Form
            {
                Section {
                    Picker("APPEARANCE", selection: $appearanceTheme) {
                        ForEach(AppearanceTheme.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                } header: {
                    Text("Appearance")
                } footer: {
                    Text("Overrides the system appearance to always use Light.")
                }
                Section("ACCOUNT") {
                    TextField("Username", text: $username)
                }
                Section("PREFERENCES") {
                    Stepper("Items per page: \(itemsPerPage)", value: $itemsPerPage, in: 10...100, step: 5)
                    Toggle("Enable notifications", isOn: $notificationsEnabled)
                }
                
                Section {
                    Button("Reset to Defaults", role: .destructive) {
                        resetDefaults()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
    func resetDefaults(){
        appearanceTheme = .system
        username = ""
        itemsPerPage = 25
        notificationsEnabled = true
    }
}

extension View {
    func setAppearanceTheme() -> some View {
        modifier(AppearanceThemeViewModifier())
    }
}


struct AppearanceThemeViewModifier: ViewModifier {
    
    @AppStorage(UserDefaultsKeys.appearanceTheme) private var appearanceTheme: AppearanceTheme = .system
    
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(scheme())
    }
    
    func scheme() -> ColorScheme? {
        switch appearanceTheme {
            case .dark: return .dark
            case .light: return .light
            case .system: return nil
        }
    }
}

#Preview {
    SettingsView()
}
