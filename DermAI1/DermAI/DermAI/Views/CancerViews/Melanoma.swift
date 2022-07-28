//
//  Melanoma.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Melanoma: View {
    var body: some View{
           VStack {
               
               Text("Melanoma")
                   .font(.title)
                   .fixedSize(horizontal: false, vertical: true)
               List {
                   Text("- Mostly develop in areas exposed to the sun")
                   Text("- More common in people with darker skin")
                   Text("- A change in an existing mole")
                   Text("- The development of a new pigmented or unusual looking growth on your skin")
       
               }.padding()
               
           }
           
       }
}

struct Melanoma_Previews: PreviewProvider {
    static var previews: some View {
        Melanoma()
    }
}
