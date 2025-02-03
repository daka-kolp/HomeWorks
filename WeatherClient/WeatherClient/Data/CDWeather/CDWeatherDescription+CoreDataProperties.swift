//
//  CDWeatherDescription+CoreDataProperties.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 03.02.2025.
//
//

import Foundation
import CoreData


extension CDWeatherDescription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherDescription> {
        return NSFetchRequest<CDWeatherDescription>(entityName: "CDWeatherDescription")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var weather: CDWeather?

}

extension CDWeatherDescription : Identifiable {

}
