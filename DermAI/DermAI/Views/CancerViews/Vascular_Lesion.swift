//
//  Vascular_Lesion.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Vascular_Lesion: View {
    var body: some View{
            VStack {
                
                Text("Vascular Lesion")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                List {
                    Text("- A raised purplish area of skin that looks like a bruise")
                    Text("- Lesion which grows larger over time")
                    Text("- A lesion that may bleed when scratched or bumped")
                    Text("- Swelling in surrounding skin")
                    
        
                }.padding()
                
            }
            
        }
}

struct Vascular_Lesion_Previews: PreviewProvider {
    static var previews: some View {
        Vascular_Lesion()
    }
}
