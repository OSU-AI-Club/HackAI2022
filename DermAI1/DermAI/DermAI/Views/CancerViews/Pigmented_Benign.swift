//
//  Pigmented_Benign.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Pigmented_Benign: View {
    var body: some View{
           VStack {
               
               Text("Pigmented Benign Keratosis")
                   .font(.title)
                   .fixedSize(horizontal: false, vertical: true)
               List {
                   Text("- A round or oval-shaped waxy or rough bump, usually on the face, chest, shoulder or back")
                   Text("- A flat growth or a slightly raised bump with a scaly surface")
                   Text("- Varied size, from very small to more than 1 inch across")
                   Text("- Varied number, ranging from single to multiple growths")
                   Text("- Itchiness")
                   Text("- Varied in color, ranging from light tan to brown or black")
       
               }.padding()
               
           }
           
       }
}

struct Pigmented_Benign_Previews: PreviewProvider {
    static var previews: some View {
        Pigmented_Benign()
    }
}
