//
//  MemberDetailsView.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

import SwiftUI

struct CountryDetailsView: View {
    @Binding var country: Country // enable two-way communication between the parent and child views
    
    var body: some View {
        VStack {
            Text("Population: \(country.population)")
            Text("Area: \(country.area) km\u{B2}")
            Text("Population density: \(country.populationDensity) persons per km\u{B2}")
                    
            MembershipView(country: $country)
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: .constant(finland))
    }
}
