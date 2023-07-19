// Models/Aquarium.swift

import Foundation

class Aquarium {
    let capacity: Int
    let waterType: WaterType
    
    init(capacity: Int, waterType: WaterType) {
        self.capacity = capacity
        self.waterType = waterType
    }
}

enum WaterType {
    case freshwater
    case saltwater
}
