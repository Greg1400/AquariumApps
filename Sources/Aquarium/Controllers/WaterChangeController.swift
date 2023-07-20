// Controllers/WaterChangeController.swift

import Foundation

class WaterChangeController {
    let aquarium: Aquarium
    let bactoElixierDosage: Double = 20.0 // mL per 100L
    let clearWaterElixierDosage: Double = 20.0 // mL per 100L
    let nextWaterChangeDate: Date?
    init(aquarium: Aquarium) {
        self.aquarium = aquarium
    }
    
    func scheduleWaterChange() {
        print("Scheduling a water change...")
        // Code pour planifier le changement d'eau
    let calendar = Calendar.current
    let oneWeekFromNow = calendar.date(byAdding: .day, value: 7, to: Date())

    nextWaterChangeDate = oneWeekFromNow

        // Demander à l'utilisateur le litrage de changement de l'eau
        print("Enter the water change capacity (in litters):")
        if let waterChangeCapacityString = readLine(), let waterChangeCapacity = Double(waterChangeCapacityString) {
            // Calcul du dosage
            let clearWaterElixierDosageForCapacity = (clearWaterElixierDosage/100.0) * waterChangeCapacity
            print("Dosage for Clear Water Elixier: \(clearWaterElixierDosageForCapacity) mL")
        } else if waterChangeCapacity >= Double(aquarium.capacity)*0.1 {
            print("Invalid water change capacity")
        }
    }
    
    
    func calculateProductDosage() {
        print("Calculating product dosage...")
        
        let totalCapacityInLiters = Double(aquarium.capacity)
        let bactoElixierDosageForCapacity = (bactoElixierDosage / 100.0) * totalCapacityInLiters

        ptrint("Dosage for Bacto Elixier : \(bactoElixierDosageForCapacity) mL")
    }

    func getNextWaterChangeDate() -> Date? {
        return nextWaterChangeDate
    }
}
