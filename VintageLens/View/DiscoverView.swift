//
//  ContentView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct DiscoverView: View {
    
    @State private var viewModel = DiscoverViewModel()
    @Environment(DiscoverCoordinator.self) private var coordinator
    
    var body: some View {
        Group {
            if viewModel.error != nil {
                ContentUnavailableView {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        
                        Text("Something went wrong")
                            .font(.system(size: 22, weight: .medium))
                        
                        Text("It seems that we couldn't fetch the data for you. Please try again later.")
                            .font(.system(size: 16, weight: .light))
                    }
                } actions: {
                    Button {
                        viewModel.tryAgain()
                    } label: {
                        Text("Try again")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.accent)
                            .clipShape(Capsule())
                    }
                    .padding()

                }

            } else {
                ScrollView(showsIndicators: false) {
                    if let vintage = viewModel.vintage {
                        VintageSection(vintage: vintage)
                            .padding(.bottom)
                    }
                    
                    if let topBrands = viewModel.topBrands {
                        TopBrandSection(topBrands: topBrands)
                            .padding(.bottom)
                    }
                    
                    if let lenses = viewModel.lenses {
                        LensesSection(lenses: lenses)
                            .padding(.bottom)
                    }
                    
                    if let dslr = viewModel.dslr {
                        DslrSection(dslr: dslr)
                            .padding(.bottom)
                    }
                }
            }
        }
        .safeAreaBar(edge: .bottom) {
            Spacer()
                .frame(height: 60)
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getVintageList()
            await viewModel.getTopBrands()
            await viewModel.getLenses()
            await viewModel.getDslr()
        }
    }
}

#Preview {
    DiscoverView()
        .environment(DiscoverCoordinator())
}

@Observable
class DiscoverViewModel {
    
    var vintage: VintageResponse?
    var topBrands: BrandResponse?
    var lenses: LensesResponse?
    var dslr: DSLRResponse?
    var error: Error?
    
    func tryAgain() {
        Task {
            await getVintageList()
            await getTopBrands()
            await getLenses()
            await getDslr()
        }
    }
    
    func getVintageList() async {
        do {
            let result = try await VintageApiClient(client: ApiClient()).getVintageShortList()
            vintage = result
            self.error = nil
        } catch {
            self.error = error
        }
    }
    
    func getTopBrands() async {
        do {
            let result = try await BrandsApiClient(client: ApiClient()).getTopBrands()
            topBrands = result
            self.error = nil
        } catch {
            self.error = error
        }
    }
    
    func getLenses() async {
        do {
            let result = try await LensesApiClient(client: ApiClient()).getTopLenses()
            lenses = result
            self.error = nil
        } catch {
            self.error = error
        }
    }
    
    func getDslr() async {
        do {
            let result = try await DslrApiClient(client: ApiClient()).getDslr()
            dslr = result
            self.error = nil
        } catch {
            self.error = error
        }
    }
}
