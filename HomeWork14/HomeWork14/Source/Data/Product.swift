//
//  product.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 06.01.2025.
//

struct Product: Decodable {
    let id: String
    let name: String
    let data: ProductData?
    
    func toString() -> String {
        return "\(id), \(name); Additianal Data: \(data?.toString() ?? "No Data")"
    }
}

struct ProductData: Decodable {
    let year: Int?
    let color: String?
    let color_: String?
    let description_: String?
    let capacity: String?
    let capacity_: String?
    let capacityGb: Int?
    let price: Double?
    let price_: String?
    let generation: String?
    let generation_: String?
    let cpuModel: String?
    let hardDiskSize: String?
    let strapColour: String?
    let caseSize: String?
    let screenSize: Double?
    
    enum CodingKeys: String, CodingKey {
        case year
        case color
        case color_ = "Color"
        case description_ = "Description"
        case capacity
        case capacity_ = "Capacity"
        case capacityGb = "capacity GB"
        case price
        case price_ = "Price"
        case generation
        case generation_ = "Generation"
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case screenSize = "Screen size"
    }
    
    func toString() -> String {
        var string: String = ""
        
        if let year { string += "Year: \(year), " }
        if let color { string += "Color: \(color), " }
        if let color_ { string += "Color: \(color_), " }
        if let description_ { string += "Description: \(description_), " }
        if let capacity { string += "Capacity: \(capacity), " }
        if let capacity_ { string += "Capacity: \(capacity_), " }
        if let capacityGb { string += "Capacity: \(capacityGb) DB, " }
        if let price { string += "Price: \(price), " }
        if let price_ { string += "Price: \(price_), " }
        if let generation { string += "Generation: \(generation), " }
        if let generation_ { string += "Generation: \(generation_), " }
        if let cpuModel { string += "CPU Model: \(cpuModel), " }
        if let hardDiskSize { string += "Hard disk size: \(hardDiskSize), " }
        if let strapColour { string += "Strap Colour: \(strapColour), " }
        if let caseSize { string += "Case Size: \(caseSize), " }
        if let screenSize { string += "Screen size: \(screenSize), " }
        
        string.removeLast(2)
        
        return string
    }
}
