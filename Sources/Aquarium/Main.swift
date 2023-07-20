// Main.swift

import Foundation
import Aquarium.Models.Sources

// Point d'entrée principal de votre application
func main() {
    print("Aquarium App")
    
    let aquarium = createAquarium()
    let fishLibrary = FishLibrary()
    
    // Utilisation des vues et des contrôleurs pour interagir avec l'utilisateur
    
    let aquariumCreationView = AquariumCreationView()
    aquariumCreationView.createAquarium(aquarium)
    
    let fishLibraryView = FishLibraryView(fishLibrary: fishLibrary)
    let selectedFish = fishLibraryView.searchFish()
    
    let waterChangeController = WaterChangeController(aquarium: aquarium)
    waterChangeController.scheduleWaterChange()
    waterChangeController.calculateProductDosage()
    
    // Autres fonctionnalités et interactions avec l'utilisateur
    
    let temperatureController = TemperatureController(aquarium: aquarium)
    temperatureController.createTemperatureGraph()
    
    let waterParametersController = WaterParametersController(aquarium: aquarium)
    waterParametersController.monitorWaterParameters()
}

// Appel de la fonction principale
main()
