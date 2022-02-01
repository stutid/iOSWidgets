//
//  URLConstants.swift
//  WidgetTutorial
//
//  Created by Stuti Dobhal on 03.12.20.
//

import Foundation

enum URLConstants {
    private static let BASE_URL = "https://servicegateway.7mind.de/v2"
    case getRandomQuotes

    var url: URL? {
        return URL(string: "\(URLConstants.BASE_URL)\(endPoint)")
    }

    var endPoint: String {
        switch self {
        case .getRandomQuotes:
            return "/mindful?lang=de"
        }
    }
}

enum HTTPMethod {
    case get

    var type: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
