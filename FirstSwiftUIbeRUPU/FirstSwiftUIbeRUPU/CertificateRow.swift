//
//  CertificateRow.swift
//  FirstSwiftUIbeRUPU
//
//  Created by be RUPU on 18/12/21.
//

import SwiftUI

struct CertificateRow: View {
    
    var certificates = certificateData
    var body: some View {
        VStack(alignment: .leading) {
            Text("Certificate")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) { item in
                        CertificateView(item: item)
                    }
                }
                .padding(20)
                .padding(.leading, 20)
            }
        }
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: Int
    var height: Int
}

let certificateData = [
    Certificate(title: "UI Design", image: "Certificate1", width: 230, height: 180),
    Certificate(title: "SwiftUI", image: "Certificate2", width: 230, height: 180),
    Certificate(title: "Sketch", image: "Certificate3", width: 230, height: 180),
    Certificate(title: "Framer", image: "Certificate4", width: 230, height: 180)
]
