//
//  DataLoaderService.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 12.01.2025.
//

import Foundation

class NetworkService {
    static let instance = NetworkService()
    
    private init() {}
    
    func perfotmRequest<T: Decodable>(
        urlRequest: URLRequest,
        responceType: T.Type,
        completion: @escaping(Result<T, Error>) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let responceData = data  else {
                completion(.failure(NSError(domain: "NoDataError", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let result  = try JSONDecoder().decode(T.self, from: responceData)
                completion(.success(result))
            } catch {
                completion(.failure(error))
                return
            }
        }
        task.resume()
    }
    
    func perfotmRequestList<T: Decodable>(
        urlRequest: URLRequest,
        responceType: T.Type,
        completion: @escaping(Result<[T], Error>) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let responceData = data  else {
                completion(.failure(NSError(domain: "NoDataError", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let result  = try JSONDecoder().decode([T].self, from: responceData)
                completion(.success(result))
            } catch {
                completion(.failure(error))
                return
            }
        }
        task.resume()
    }
}
