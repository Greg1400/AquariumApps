// Views/FishLibraryView.swift

import Foundation

class FishLibraryView {
    let fishLibrary: FishLibrary
    
    init(fishLibrary: FishLibrary) {
        self.fishLibrary = fishLibrary
    }
    
    func searchFish() -> Fish? {
        print("Searching for a fish...")
        // Code to search for a fish in the library
        
        // For demonstration purposes, let's assume you have the name of the fish from user input
        print("Enter the name of the fish:")
        if let fishName = readLine() {
            // Load the fish data from the JSON file
            if let fishData = loadFishDataFromJSON() {
                // Search for the fish by name
                let foundFish = fishData.first { $0.commonName.lowercased() == fishName.lowercased() }
                if let fish = foundFish {
                    print("Found fish: \(fish.commonName) (\(fish.species))")
                    return fish
                } else {
                    print("Fish not found.")
                }
            } else {
                print("Error loading fish data from JSON file.")
            }
        } else {
            print("Invalid input.")
        }
        
        return nil
    }
    
    // Method to load fish data from the JSON file
    private func loadFishDataFromJSON() -> [Fish]? {
        // Load the JSON file from the specified path (assuming "FishName.json" is in the app bundle)
        if let jsonURL = Bundle.main.url(forResource: "FishName", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let fishData = try decoder.decode([Fish].self, from: jsonData)
                return fishData
            } catch {
                print("Error decoding fish data from JSON: \(error)")
                return nil
            }
        } else {
            print("Fish data JSON file not found.")
            return nil
        }
    }
}
