//
//  MembershipView.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

import SwiftUI

struct MembershipView: View {
    @Binding var country: Country
    
    var body: some View {
        VStack {
            // checks if the country is a member of the Eurozone
            HStack {
                if country.isEuroZone {
                    Text("Eurozone member")
                        .foregroundColor(.green)
                    Image(systemName: "eurosign.square")// Display Euro sign icon
                        .font(.system(size: 48.0))
                        .foregroundColor(.green)// Set icon color to green
                }
            }
            // checks if the country is a member of the Schengen Area
            HStack {
                if country.isSchengen {
                    Text("Schengen member")
                        .foregroundColor(.blue)
                    Image(systemName: "s.circle")
                        .font(.system(size: 48.0))
                        .foregroundColor(.blue)
                }
            }
            
        }
    }
}

struct MembershipView_Previews: PreviewProvider {
    static var previews: some View {
        MembershipView(country: .constant(finland))
    }
}
