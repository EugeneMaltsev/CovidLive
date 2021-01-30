import Cocoa

//var str = "Hello, playground"

class Covid {
    
    func testOne() {

        
        
        let url = URL(string: "https://covid-19-data.p.rapidapi.com/totals")
        
        guard url != nil else {
            return
        }
        
        var request = URLRequest(url: url!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        
        let header = [
            "x-rapidapi-key": "52254454a3mshf50d9c988705d2fp134e72jsndfee2fd06590",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
        ]
        
        request.allHTTPHeaderFields = header
        
        let jsonObject = []
        
    }
    
}


let myClass = Covid()
print(myClass.testOne())
