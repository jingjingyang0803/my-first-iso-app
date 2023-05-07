//
//  CountryListItem.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 5.5.2023.
//

//https://flagpedia.net/organization/eu
//https://flagpedia.net/download/icons

import SwiftUI

struct CountryListItem: View {
    @State var country: Country

    var body: some View {
        // Navigate to the CountryView when the list item is tapped
        NavigationLink(destination: CountryView(country: country)) {
            HStack {
                Image(country.code.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 20)

                Text(country.name)

                Spacer()

                if country.isEuroZone {
                    Image(systemName: "eurosign.square.fill")
                        .font(.system(size: 24.0))
                        .foregroundColor(.green)
                }else {
                    Text("")
                        .frame(width: 30, height: 20)
                }
                
                if country.isSchengen {
                    Image(systemName: "s.circle.fill")
                        .font(.system(size: 24.0))
                        .foregroundColor(.blue)
                }else {
                    Text("")
                        .frame(width: 30, height: 20)
                }
                
            }
        }
    }
}

struct CountryListItem_Previews: PreviewProvider {
    static var previews: some View {
        CountryListItem(country: finland)
    }
}
