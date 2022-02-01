//
//  QuoteViewModel.swift
//  WidgetTutorial
//
//  Created by Stuti Dobhal on 03.12.20.
//

import Foundation

class QuoteViewModel {

    //MARK:- Properties
    private let apiManager = ApiManager.shared

    //MARK:- Fetch quotes
    func fetchQuotes(completion : @escaping (Quote) -> ()) {
        let url = URLConstants.getRandomQuotes.url
        let request = apiManager.createRequest(url: url, method: .get)
        apiManager.fetch(request: request) { (data, error) in
            guard let data = data else { return }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                completion(quote)
            } catch {
                print("Error with decoding")
            }
        }
    }

//    func fetchQuotes() -> Quote {
//        let quotes = [Quote(author: "Robinson", quote: "my day is beautiful"),
//                      Quote(author: "Tony", quote: "good morning"),
//                      Quote(author: "Bobby", quote: "i am having fun"),
//                      Quote(author: "Ricky", quote: "sun is out"),
//                      Quote(author: "Sam", quote: "love everyone")]
//        let randomQuotes = quotes.randomElement() ?? Quote(author: "Anonymous", quote: "My random quote is so positive")
//        return randomQuotes
//    }
}
