//
//  ButtonView.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 4.5.2023.
//

import SwiftUI

struct ButtonView: View {
    @Binding var country: Country
    
    var body: some View {
        Button(action: {
            // Constructing the wikipedia URL for the country
            let url = URL(string: "https://en.m.wikipedia.org/wiki/\(country.name.replacingOccurrences(of: " ", with: "_"))")!
            let options: [UIApplication.OpenExternalURLOptionsKey: Any] = [.universalLinksOnly: false]
            
            // Opening the wikipedia URL in a web browser
            UIApplication.shared.open(url, options: options)
        }) {
            Text("Open Wikipedia (\(country.name))")
        }.font(.title2)
            .buttonStyle(.borderedProminent)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(country: .constant(finland))
    }
}
