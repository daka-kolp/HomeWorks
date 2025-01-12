//
//  NetworkService+Products.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 12.01.2025.
//
import Foundation

extension NetworkService {
    private var baseUrl: String {
        get {
            return "https://api.restful-api.dev/objects"
        }
    }
    
    func fetchProducts(
        completion: (([Product]) -> Void)?,
        completionError: ((Error) -> Void)?
    ) {
        let urlString = baseUrl
        guard let url = URL(string: urlString)
        else {
            assertionFailure("Url is invalid \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        perfotmRequestList(
            urlRequest: request,
            responceType: Product.self
        ) { result in
            switch result {
            case .success (let products):
                completion?(products)
            case .failure (let error):
                completionError?(error)
            }
        }
    }
    
    func fetchProductsByIds(
        ids: [Int],
        completion: (([Product]) -> Void)?,
        completionError: ((Error) -> Void)?
    ) {
        let idsString = ids.map({"id=\($0)"}).joined(separator: "&")
        let urlString = baseUrl + "?\(idsString)"
        
        guard let url = URL(string: urlString)
        else {
            assertionFailure("Url is invalid \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        perfotmRequestList(
            urlRequest: request,
            responceType: Product.self
        ) { result in
            switch result {
            case .success (let products):
                completion?(products)
            case .failure (let error):
                completionError?(error)
            }
        }
    }
    
    func fetchProductById(
        id: Int,
        completion: ((Product) -> Void)?,
        completionError: ((Error) -> Void)?
    ) {
        let urlString = baseUrl + "/\(id)"
        
        guard let url = URL(string: urlString)
        else {
            assertionFailure("Url is invalid: \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        perfotmRequest(
            urlRequest: request,
            responceType: Product.self
        ) { result in
            switch result {
            case .success (let product):
                completion?(product)
            case .failure (let error):
                completionError?(error)
            }
        }
    }
}
