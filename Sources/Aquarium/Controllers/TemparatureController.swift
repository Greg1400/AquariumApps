// Controllers/TemperatureController.swift

import Foundation

class TemperatureController {
    let aquarium: Aquarium
    
    init(aquarium: Aquarium) {
        self.aquarium = aquarium
    }
    
    func createTemperatureGraph() {
        print("Creating temperature graph...")
        // Code pour créer un graphique de température basé sur les données de l'aquarium

        //For Demonstration purposes, let's assume we have some temprature dats
        let temperatureData: [Double] = [25.0,26.0,24.5,23.8,25.5,26.5]
// Assuming you have a graphing library or custom drawing logic to create the graph
        // Draw the graph with the temperature data and the ideal temperature range (20.0°C to 25.0°C)
        print("Temperature graph:")
        for (index, temperature) in temperatureData.enumerated() {
            let date = Calendar.current.date(byAdding: .day, value: -6 + index, to: Date())!
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let dateString = dateFormatter.string(from: date)
            print("\(dateString): \(temperature)°C")
        }
        
        let idealTemperatureMin = 20.0
        let idealTemperatureMax = 25.0
        print("Ideal Temperature Range: \(idealTemperatureMin)°C to \(idealTemperatureMax)°C")
        
        // Assuming you have a method to draw a dotted line on the graph representing the ideal temperature range
        drawDottedLineOnGraph(idealTemperatureMin: idealTemperatureMin, idealTemperatureMax: idealTemperatureMax)
    }
    
    // Method to draw a dotted line on the graph representing the ideal temperature range
    private func drawDottedLineOnGraph(idealTemperatureMin: Double, idealTemperatureMax: Double) {
        // Code to draw a dotted line on the graph using the graphing library or custom drawing logic
        print("Dotted line drawn on the graph representing the ideal temperature range.")
    }
}
