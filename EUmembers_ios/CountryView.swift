//
//  CountryView.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

import SwiftUI

struct CountryView: View {
    @State var country: Country
    
    var body: some View {
        VStack {
            Text(country.name)
                .font(.largeTitle)
            
            Image(country.code.lowercased())
                .resizable() // Make the image resizable
                .scaledToFit() // Scale the image to fit the available space
                .border(Color.black, width: 1) // Add a black border around the image
            
            CountryDetailsView(country: $country)
            
            Spacer()// add a space between the CountryDetailsView and the ButtonView
            
            ButtonView(country: $country)
        }
        .padding()
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: finland)
    }
}
