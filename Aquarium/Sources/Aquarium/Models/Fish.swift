import Foundation

struct FishLibrary {
    let fishes: [Fish]
    
    init() {
        fishes = loadFishData()
    }
    
    private func loadFishData() -> [Fish] {
        // Effectuez ici l'appel à l'API Fishbase pour obtenir les données des poissons
        
        // Exemple d'appel à l'API Fishbase
        guard let url = URL(string: "https://fishbase.us/rest/species") else {
            print("Invalid API URL")
            return []
        }
        
        var fishes: [Fish] = []
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            defer {
                semaphore.signal()
            }
            
            if let error = error {
                print("API request error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let fishResponse = try decoder.decode([Fish].self, from: data)
                fishes = fishResponse
            } catch {
                print("Error decoding API response: \(error)")
            }
        }
        
        task.resume()
        semaphore.wait()
        
        return fishes
    }
}

// Structure pour représenter les données renvoyées par l'API Fishbase
struct Fish: Codable {
    let species: String
    let commonName: String
    let family: String
    let order: String
    // Ajoutez d'autres propriétés selon les données renvoyées par l'API Fishbase
}

// Test du code
let fishLibrary = FishLibrary()
let fishes = fishLibrary.fishes
