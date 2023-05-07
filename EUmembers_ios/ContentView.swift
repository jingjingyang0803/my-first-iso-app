//
//  ContentView.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: CountryManager

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Past Members (\(manager.countries.filter { $0.isMember == false }.count))")) {
                    ForEach(manager.countries.filter { $0.isMember == false }) { country in
                        CountryListItem(country: country)
                    }
                }
                Section(header: Text("Current Members (\(manager.countries.filter { $0.isMember == true }.count))")) {
                    ForEach(manager.countries.filter { $0.isMember == true }) { country in
                        CountryListItem(country: country)
                    }
                }
            }
            .navigationTitle("EU Members")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryManager())
    }
}
