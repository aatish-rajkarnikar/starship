//
//  RowView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import SwiftUI

struct RowView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        HStack{
            Text(title).bold().frame(width: 150, alignment: .leading)
            Text(value)
            Spacer()
        }
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "Title", value: "value").previewLayout(.sizeThatFits)
    }
}
