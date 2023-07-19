// Views/FishLibraryView.swift

import Foundation

class FishLibraryView {
    let fishLibrary: FishLibrary
    
    init(fishLibrary: FishLibrary) {
        self.fishLibrary = fishLibrary
    }
    
    func searchFish() -> Fish? {
        print("Searching for a fish...")
        // Code pour rechercher des poissons dans la bibliothèque
        return fishLibrary.fishes.first
    }
}
