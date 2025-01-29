//
//  FileService.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 27.01.2025.
//

import Foundation

protocol FileServiceProtocol {
    func save<T: Encodable>(_ object: T, to fileName: String) throws
    func load<T: Decodable>(_ type: T.Type, from fileName: String) throws -> T
}

final class FileService: FileServiceProtocol {
    private let fileManager: FileManager
    
    init(fileManager: FileManager = FileManager.default) {
        self.fileManager = fileManager
    }
    
    func save<T: Encodable>(_ object: T, to fileName: String) throws {
        let url = try getDocumentsDirectory().appendingPathComponent(fileName)
        let data = try JSONEncoder().encode(object)
        try data.write(to: url)
    }
    
    func load<T: Decodable>(_ type: T.Type, from fileName: String) throws -> T {
        let url = try getDocumentsDirectory().appendingPathComponent(fileName)
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    private func getDocumentsDirectory() throws -> URL {
        guard let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            throw URLError(.fileDoesNotExist)
        }
        return documentsDirectory
    }
}
