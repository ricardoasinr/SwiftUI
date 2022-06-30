//
//  DismissView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
           
            Button("Volver atras"){
                dismiss()
            }.tint(.red)
        }
    }
}

struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}
