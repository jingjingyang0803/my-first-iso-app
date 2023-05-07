//
//  CountryManager.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 4.5.2023.
//

//
//  CountryManager.swift
//  EUMembers
//
//  Created by Jere Käpyaho (TAMK) on 21.4.2023.
//

import Foundation

class CountryManager: ObservableObject {
    @Published var countries: [Country]
    
    init() {
        self.countries = []
//        self.loadCountriesWithURLSession()
        //parsing JSON from a string for quick testing
        self.parseCountries()
    }

    // Load the country data from the URL asynchronously using URLSession.
    // Note that the published property must be updated from the main thread,
    // that is why it is wrapped in DispatchQueue.main.async block.
    private func loadCountriesWithURLSession() {
        if let url = URL(string: "https://wy3dsyi6k62vlns5tmm72zlbcu0vnxda.lambda-url.eu-north-1.on.aws/") {
            print("About to hit lambda function URL to get countries (URLSession)")
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    if let countries = try? decoder.decode([Country].self, from: jsonData) {
                        print("Countries loaded from lambda function URL (URLSession)")
                        
                        // Whenever the published property is changed, it will be reflected in the UI.
                        // But the changes must be made on the main thread, where the UI runs.
                        DispatchQueue.main.async {
                            self.countries = []
                        }
                        
                        // At this point everything has been downloaded from the network.
                        
                        for country in countries {
                            DispatchQueue.main.async {
                                self.countries.append(country)
                            }
                        }
                    }
                    else {
                        print("Error parsing JSON data")
                    }
                } else if let error = error {
                    print("Unable to retrieve JSON data, error: \(error)")
                }
            }
            task.resume() // Start the data task
        }
        else {
            print("Bad URL")
        }
    }
    
    // Parse the JSON data from a static string.
    private func parseCountries() {
        let jsonData = self.jsonString.data(using: .utf8)!
        self.countries = try! JSONDecoder().decode([Country].self, from: jsonData)
    }
    
    private let jsonString = """
[{"area":83879,"code":"AT","isEuroZone":true,"name":"Austria","isMember":true,"isSchengen":true,"population":9027999},{"area":30528,"code":"BE","isEuroZone":true,"name":"Belgium","isMember":true,"isSchengen":true,"population":11584008},{"area":111002,"code":"BG","isEuroZone":false,"name":"Bulgaria","isMember":true,"isSchengen":false,"population":6520314},{"area":9251,"code":"CY","isEuroZone":true,"name":"Cyprus","isMember":true,"isSchengen":false,"population":1244188},{"area":78867,"code":"CZ","isEuroZone":false,"name":"Czech Republic","isMember":true,"isSchengen":true,"population":10524167},{"area":357340,"code":"DE","isEuroZone":true,"name":"Germany","isMember":true,"isSchengen":true,"population":83695430},{"area":42921,"code":"DK","isEuroZone":false,"name":"Denmark","isMember":true,"isSchengen":true,"population":5910577},{"area":45227,"code":"EE","isEuroZone":true,"name":"Estonia","isMember":true,"isSchengen":true,"population":1331824},{"area":131957,"code":"EL","isEuroZone":true,"name":"Greece","isMember":true,"isSchengen":true,"population":10432481},{"area":505970,"code":"ES","isEuroZone":true,"name":"Spain","isMember":true,"isSchengen":true,"population":47450795},{"area":338435,"code":"FI","isEuroZone":true,"name":"Finland","isMember":true,"isSchengen":true,"population":5553000},{"area":632833,"code":"FR","isEuroZone":true,"name":"France","isMember":true,"isSchengen":true,"population":67897000},{"area":248528,"code":"GB","isEuroZone":false,"name":"United Kingdom","isMember":false,"isSchengen":true,"population":60800000},{"area":56594,"code":"HR","isEuroZone":true,"name":"Croatia","isMember":true,"isSchengen":true,"population":3888529},{"area":93024,"code":"HU","isEuroZone":false,"name":"Hungary","isMember":true,"isSchengen":true,"population":9749763},{"area":69797,"code":"IE","isEuroZone":true,"name":"Ireland","isMember":true,"isSchengen":false,"population":5123536},{"area":302073,"code":"IT","isEuroZone":true,"name":"Italy","isMember":true,"isSchengen":true,"population":58983000},{"area":65300,"code":"LT","isEuroZone":true,"name":"Lithuania","isMember":true,"isSchengen":true,"population":2832718},{"area":2586,"code":"LU","isEuroZone":true,"name":"Luxembourg","isMember":true,"isSchengen":true,"population":645397},{"area":64573,"code":"LV","isEuroZone":true,"name":"Latvia","isMember":true,"isSchengen":true,"population":1907675},{"area":316,"code":"MT","isEuroZone":true,"name":"Malta","isMember":true,"isSchengen":true,"population":519562},{"area":41540,"code":"NL","isEuroZone":true,"name":"Netherlands","isMember":true,"isSchengen":true,"population":17740000},{"area":312679,"code":"PL","isEuroZone":false,"name":"Poland","isMember":true,"isSchengen":true,"population":38179800},{"area":92225,"code":"PT","isEuroZone":true,"name":"Portugal","isMember":true,"isSchengen":true,"population":10344802},{"area":238391,"code":"RO","isEuroZone":false,"name":"Romania","isMember":true,"isSchengen":false,"population":19038098},{"area":438574,"code":"SE","isEuroZone":false,"name":"Sweden","isMember":true,"isSchengen":true,"population":10481937},{"area":49035,"code":"SK","isEuroZone":true,"name":"Slovakia","isMember":true,"isSchengen":true,"population":5460185},{"area":20273,"code":"SI","isEuroZone":true,"name":"Slovenia","isMember":true,"isSchengen":true,"population":2108708}]
"""
}
