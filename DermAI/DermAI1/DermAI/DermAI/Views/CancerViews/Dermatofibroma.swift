//
//  Dermatofibroma.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Dermatofibroma: View {
    var body: some View{
            VStack {
                
                Text("Dermatofibroma")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                List {
                    Text("- Most often found on the arms and legs of women")
                    Text("- Small brown/reddish-brown firm mobile nodules")
                    Text("- May be tender to touch")
                    Text("- They generally do not change in size")
        
                }.padding()
                
            }
            
        }
}

struct Dermatofibroma_Previews: PreviewProvider {
    static var previews: some View {
        Dermatofibroma()
    }
}
