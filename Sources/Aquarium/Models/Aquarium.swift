// Models/Aquarium.swift

import Foundation

class Aquarium {
    let capacity: Int
    let waterType: WaterType
    
    init(capacity: Int, waterType: WaterType) {
        self.capacity = capacity
        self.waterType = waterType
    }

    // Function to create an aquarium object
    static func createAquarium() -> Aquarium {
        // Prompt the user for aquarium capacity
        print("Enter the aquarium's capacity (in liters):")
        if let capacityString = readLine(), let capacity = Int(capacityString) {
            // Prompt the user to choose water type
            print("Choose the water type (freshwater or saltwater):")
            if let waterTypeString = readLine()?.lowercased(), let waterType = WaterType(rawValue: waterTypeString) {
                // Create and return the aquarium object
                return Aquarium(capacity: capacity, waterType: waterType)
            } else {
                print("Invalid water type. The aquarium was not created.")
            }
        } else {
            print("Invalid capacity. The aquarium was not created.")
        }
        
        // Return a default aquarium if input is invalid
        return Aquarium(capacity: 50, waterType: .freshwater)
    }
}

enum WaterType: String {
    case freshwater
    case saltwater
}
