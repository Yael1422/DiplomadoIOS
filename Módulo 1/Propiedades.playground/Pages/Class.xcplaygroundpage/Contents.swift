import Foundation

class Vehicle {
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    var wheels: Int?
    
    var type: String {
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (name: String, serialNumber: String, type: String)? {
        get {
            if let owner = owner {
                return (owner, serialNumber, type)
            }
            return nil
        }
        set(newRegistration) {
            if let newRegistration = newRegistration {
                owner = newRegistration.name
            }
        }
    }
    
    init(brand: String, model: String, serialNumber: String, wheels: Int) {
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
        self.wheels = wheels
    }
}

let myVehicle = Vehicle(brand: "1234|", model: "Toyota", serialNumber: "123456789", wheels: 3)
