//
//  Actinic_Keratosis.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Actinic_Keratosis: View {
    var body: some View{
        VStack {
            
            Text("Actinic Keratosis")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- Rough, dry or scaly patch of skin")
                Text("- Slight bump on the top layer of skin")
                Text("- In some cases, a hard, wartlike surface")
                Text("- Color variations, including pink, red or brown")
                Text("- Itching, burning, bleeding or crusting")
                Text("- New patches or bumps on sun-exposed areas of head, neck, hands and forearms")
            }.padding()
            
        }
        
    }
    
    
}

struct Actinic_Keratosis_Previews: PreviewProvider {
    static var previews: some View {
        Actinic_Keratosis()
    }
}
