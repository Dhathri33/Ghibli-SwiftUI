//
//  NetworkManager.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func getDataFromServer(url: String) async -> [Movies] {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return []
        }
        
        do{
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let fetchedData = try decoder.decode([Movies].self, from: data)
            return fetchedData
        }
        catch {
            print("Error fetching/ parsing the data")
            return []
        }
    }
}
