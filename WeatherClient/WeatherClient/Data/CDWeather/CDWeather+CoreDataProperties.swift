//
//  CDWeather+CoreDataProperties.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 03.02.2025.
//
//

import Foundation
import CoreData


extension CDWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

    @NSManaged public var humidity: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var pressure: String?
    @NSManaged public var temperature: String?
    @NSManaged public var wind: String?
    @NSManaged public var dateTime: Date?
    @NSManaged public var coordinates: String?
    @NSManaged public var weatherDescriptions: NSSet?

}

// MARK: Generated accessors for weatherDescriptions
extension CDWeather {

    @objc(addWeatherDescriptionsObject:)
    @NSManaged public func addToWeatherDescriptions(_ value: CDWeatherDescription)

    @objc(removeWeatherDescriptionsObject:)
    @NSManaged public func removeFromWeatherDescriptions(_ value: CDWeatherDescription)

    @objc(addWeatherDescriptions:)
    @NSManaged public func addToWeatherDescriptions(_ values: NSSet)

    @objc(removeWeatherDescriptions:)
    @NSManaged public func removeFromWeatherDescriptions(_ values: NSSet)

}

extension CDWeather : Identifiable {

}
