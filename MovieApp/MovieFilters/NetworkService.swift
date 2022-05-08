//
//  NetworkService.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation
import UIKit
enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)
    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
protocol NetworkServiceProtocol{
    func pomRequest(_ url: String)->URLRequest
//    func getPopular(completionHandler: @escaping
//                    (Result<moviesDownload, RequestError>)->())
//    func getGenres(completionHandler: @escaping
//                    (Result<genres, RequestError>)->Void)
//    func getTopRated(completionHandler: @escaping
//                    (Result<moviesDownload, RequestError>)->Void)
//    func getTrendingDay(completionHandler: @escaping
//                    (Result<moviesDownload, RequestError>)->Void)
//    func getTrendingWeek(completionHandler: @escaping
//                    (Result<moviesDownload, RequestError>)->Void)
//    func getRecommended(_ id: Int,completionHandler: @escaping
//                    (Result<moviesDownload, RequestError>)->Void)
//    
}

class NetworkService {
    func executeUrlRequest<T:Decodable>(_ request: URLRequest)async throws ->T{
        let(data, response) = try await URLSession.shared.data(for:request)
        guard let httpResponse = response as? HTTPURLResponse,
                               (200...299).contains(httpResponse.statusCode)
        else {
            throw RequestError.serverError
        }
        guard let value = try? JSONDecoder().decode(T.self, from: data) else {
            throw RequestError.dataDecodingError
            //
        }
        //
        print(type(of: value))
        return value
            
    }
    
    

    }
    
extension NetworkService: NetworkServiceProtocol{
    func pomRequest(_ url : String) ->URLRequest{
        var url1 = URL(string:url)!
        var request = URLRequest(url: url1)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}



