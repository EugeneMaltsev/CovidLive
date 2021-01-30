//
//  KannaTest.swift
//  CovidLive
//
//  Created by Eugene Maltsev on 22.01.2021.
//

import Foundation

struct covidProperties: Codable {
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
    
    func getAPI () -> String {
        
        var json = [covidProperties]()
        
        let headers = [
            "x-rapidapi-key": "52254454a3mshf50d9c988705d2fp134e72jsndfee2fd06590",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-data.p.rapidapi.com/totals?format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        

        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
//                print(error!) // Don't forget change the unwrap
            } else {
                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse!) // Don't forget change the unwrap
            }
                
//            var result:covidProperties?
            var result = [covidProperties]()


            do {
                result = try JSONDecoder().decode(Array<covidProperties>.self, from: data!)
                
            } catch {
                print("FAILED TO CONVERT: \(error)")
            }
            

//            guard let json = result else {
//                return
//            }

//            result.append(contentsOf:json)
//            print(json.deaths)
//            print(result.description)
        
        })
        
//        print(json)
        dataTask.resume()
        
        print(session)
        return "Hey"
    }
    
}


let covid = Covid()
