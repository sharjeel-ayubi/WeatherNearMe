//
//  NetworkService.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import Foundation

protocol NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class DefaultNetworkService: NetworkService {
    
    var task: URLSessionTask?
    
    func request<Request>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) where Request : DataRequest {
        
        guard var urlComponent = URLComponents(string: request.url) else {
            completion(.failure(CustomErrors.invalidURL))
            return
        }
        
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            queryItems.append(queryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            completion(.failure(CustomErrors.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.header
        
        task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(NSError()))
            }
            
            guard let data = data else {
                return completion(.failure(NSError()))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    
}
