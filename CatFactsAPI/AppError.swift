//
//  AppError.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import Foundation

public enum AppError: Error {
    case badURL(String)
    case networkClientError(Error)
    case decodingError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
}
