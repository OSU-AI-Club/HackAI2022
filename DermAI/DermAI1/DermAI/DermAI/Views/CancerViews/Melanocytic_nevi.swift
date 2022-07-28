//
//  Melanocytic.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Melanocytic_nevi: View {
    var body: some View{
            VStack {
                
                Text("Melanocytic nevi")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                List {
                    Text("- Any moles that are asymmetrical")
                    Text("- Moles that might have irregular borders")
                    Text("- Moles that might not be uniform in color")
                    Text("- Moles that might have a diameter larger than a pencil’s eraser")
                    Text("- Moles that are evolving or changing in size, shape or color")
        
                }.padding()
                
            }
            
        }
}

struct Melanocytic_nevi_Previews: PreviewProvider {
    static var previews: some View {
        Melanocytic_nevi()
    }
}
