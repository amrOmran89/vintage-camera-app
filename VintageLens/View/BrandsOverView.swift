//
//  AllBrandsView.swift
//  VintageLens
//
//  Created by Amr Omran on 25.09.25.
//

import SwiftUI

struct BrandsOverView: View {
    
    @State private var viewModel = BrandOverviewViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 120)),
                GridItem(.flexible(minimum: 120)),
            ]) {
                ForEach(viewModel.brandList) { brand in
                    BrandCardView(brand: brand, width: 120)
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal)
        }
        .task {
            await viewModel.getAllBrands()
        }
    }
}

#Preview {
    BrandsOverView()
}

@Observable
class BrandOverviewViewModel {
    
    var brandList: [Brand] = []
    
    func getAllBrands() async {
        do {
            let result = try await BrandsApiClient(client: .init()).getAllBrands()
            brandList = result
        } catch {
            print(error)
        }
    }
}
