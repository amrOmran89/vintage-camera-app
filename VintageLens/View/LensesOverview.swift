//
//  LensesOverview.swift
//  VintageLens
//
//  Created by Amr Omran on 25.09.25.
//

import SwiftUI

struct LensesOverview: View {
    
    @State var viewModel = LensesOverviewViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100)),
            ]) {
                ForEach(viewModel.lenses) { lens in
                    LensCardView(lens: lens)
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal)
        }
        .task {
            await viewModel.getLenses()
        }
    }
}

#Preview {
    LensesOverview()
}


@Observable
class LensesOverviewViewModel {
    
    var lenses = [Lens]()
    
    func getLenses() async {
        do {
            let result = try await LensesApiClient(client: .init()).getAllLenses()
            lenses = result
        } catch {
            print(error)
        }
    }
}
