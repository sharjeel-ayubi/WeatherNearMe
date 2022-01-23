//
//  DataRequest.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol DataRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var header: [String:String] { get }
    var queryItems: [String:String] { get }
    
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension DataRequest {
    var header: [String:String] { [:] }
    var queryItems: [String:String] { [:] }
}
