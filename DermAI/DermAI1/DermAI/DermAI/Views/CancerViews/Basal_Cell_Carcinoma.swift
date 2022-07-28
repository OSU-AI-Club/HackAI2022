//
//  Basal_Cell_Carcinoma.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Basal_Cell_Carcinoma: View {
    var body: some View{
            VStack {
                
                Text("Basal Cell Carcinoma")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                List {
                    Text("- A shiny skin-colored bump that’s translucent")
                    Text("- A brown, black or blue lesion")
                    Text("- A flat scaly patch with a raised edge")
                    Text("- A white, waxy, scar-like lesion without a clearly defined border")
        
                }.padding()
                
            }
            
        }
}

struct Basal_Cell_Carcinoma_Previews: PreviewProvider {
    static var previews: some View {
        Basal_Cell_Carcinoma()
    }
}
