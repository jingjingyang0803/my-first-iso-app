//
//  EUmembers_iosApp.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

//App description
//When the app is started, it displays a list of all the current and past member countries of the European Union. The list has separate sections for current and past members. For each country, show its name, a small version of its flag, and a row of small badges that indicate membership in the eurozone and the Schengen agreement. Design the list items as a collection of nested views.
//When the user taps on a country, they are taken to a new screen with information about the selected country. It shows the name of the country in title size, a large image of the country’s national flag, and information about its area and population. Also, a larger version of the membership badge row should be shown here, with information about the country’s membership status.
//In addition to the country information, this country screen has a button that opens the Safari browser on the iOS device and loads the English Wikipedia page for the country (from mobile- optimized Wikipedia). For this feature you need to learn about SwiftUI Button views and opening a URL address from inside your app.
//All country data is loaded from the web (see URL address below in Resources) in JSON format. Your app will need to parse this format into Swift objects which are then used in the app. Do not use static data in your app, other than a single country object for preview purposes.
                                                                                                                                                    
                                                                                                                                                    
let finland = Country(code: "FI", name: "Finland", area: 338_435, population: 5_555_300, isMember: true, isEuroZone: true, isSchengen: true)

import SwiftUI

@main
struct EUmembers_iosApp: App {
    @StateObject private var manager = CountryManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
