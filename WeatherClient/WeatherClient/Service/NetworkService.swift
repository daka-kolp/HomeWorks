//
//  NetworkServiceProtocol.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 27.01.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        headers: [String: String]?,
        body: Data?
    ) async -> Result<T, Error>
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        headers: [String : String]?,
        body: Data?
    ) async -> Result<T , Error> {
        guard let url = URL(string: endpoint) else {
            return .failure(NSError(domain: "Url is invalid",  code: -1, userInfo: nil))
        }
        let request = buildRequest(url: url, method: method, headers: headers, body: body)
        return await performRequest(urlRequest: request)
    }
    
    private func buildRequest(
        url: URL,
        method: HTTPMethod,
        headers: [String: String]?,
        body: Data?
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        request.httpBody = body
        return request
    }
    
    private func performRequest<T: Decodable>(urlRequest: URLRequest) async -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(URLError(.badServerResponse))
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let desc = "Bad response: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))"
                return .failure(
                    NSError(
                        domain: "HTTPError",
                        code: httpResponse.statusCode,
                        userInfo: [ NSLocalizedDescriptionKey: desc ]
                    )
                )
            }
            
            let decoder = JSONDecoder()
            let result  = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
