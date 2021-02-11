//
//  KannaTest.swift
//  CovidLive
//
//  Created by Eugene Maltsev on 22.01.2021.
//

import Foundation

struct CovidProperties: Codable {
    var confirmed:Int?
    var deaths:Int?
    var recovered:Int?
/*
     **********EXTRA OPTIONS**********
     var critical:Int?
     var lastChange:String?
     var lastUpdate:String?
     *********************************
*/
}

class Covid {
    
    func getAPI(completionHandler2 handler2: @escaping (Array<CovidProperties>?) -> Void) -> Void {
        var request = URLRequest(url: URL(string: "https://covid-19-data.p.rapidapi.com/totala?format=json")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "x-rapidapi-key": "52254454a3mshf50d9c988705d2fp134e72jsndfee2fd06590",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
        ]
        
        let dataTaskCompletionHandler = { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard error == nil else {
                print("[ERROR]: \(error!)")
                handler2(nil)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("[UNEXPECTED RESPONSE]")
                handler2(nil)
                return
            }
            guard httpResponse.statusCode == 200 else {
                print("[UNEXPECTED STATUS CODE]: \(httpResponse.statusCode)")
                handler2(nil)
                return
            }
            guard let data = data else {
                print("[NO RESPONSE DATA]")
                handler2(nil)
                return
            }
            guard let result = try? JSONDecoder().decode(Array<CovidProperties>.self, from: data) else {
                print("[UNEXPECTED RESPONSE DATA]")
                handler2(nil)
                return
            }
            handler2(result)
        }
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: dataTaskCompletionHandler)
        dataTask.resume()
    }

}

let covid = Covid()
