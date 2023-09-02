//
//  DetailsProductScreen.swift
//  E Commerce App
//
//  Created by Olsera on 03/09/23.
//

import SwiftUI

struct DetailsProductScreen: View {
    @EnvironmentObject var viewModel: DetailProductViewModel
    var body: some View {
        let product = viewModel.product
        VStack(alignment: .leading, spacing: 2) {
            Text("Description")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color("blackApp"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(product.description)
                .font(.system(size: 12))
                .foregroundColor(Color.gray)
                .padding(.bottom)
            
            HStack {
                Text("Stock: ")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                
                Text("\(product.stock)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("primaryApp"))
            }
            .padding(.bottom)
            
            HStack {
                Text("Discount: ")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                
                Text("\(String(format: "%.2f", product.discountPercentage)) %")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("primaryApp"))
            }
            
            Text(String(format: "%.2f", product.discountPercentage))
                .font(.system(size: 12))
                .foregroundColor(Color.gray)
                .padding(.bottom)
            
        }
        
    }
}

struct DetailsProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsProductScreen()
            .environmentObject(DetailProductViewModel())
    }
}
