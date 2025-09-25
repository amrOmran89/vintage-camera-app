//
//  VintageOverview.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct VintageOverview: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    
    @State var viewModel = VintageOverviewViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100)),
            ]) {
                ForEach(viewModel.vintageList) { vintage in
                    VintageCardView(vintage: vintage)
                        .onTapGesture {
                            coordinator.push(.details(vintage))
                        }
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal)
            .task {
                await viewModel.getVintageList()
            }
        }
    }
}


@Observable
class VintageOverviewViewModel {
    
    var vintageList = [Vintage]()
    var error: Error?

    
    func getVintageList() async {
        do {
            let result = try await VintageApiClient(client: ApiClient()).getAll()
            vintageList = result
        } catch {
            self.error = error
        }
    }
}
