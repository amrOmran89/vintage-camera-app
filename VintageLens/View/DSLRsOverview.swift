//
//  DSLRsOverview.swift
//  VintageLens
//
//  Created by Amr Omran on 29.09.25.
//

import SwiftUI

struct DSLRsOverview: View {
    
    @State private var viewModel = DSLRsOverviewViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.cameras) { camera in
                    VStack(alignment: .leading, spacing: 8) {
                        Image(camera.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        Text(camera.brand + " " + camera.model)
                            .font(.headline)
                        Text("Released: \(camera.year)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Price: \(camera.price, specifier: "%.0f") \(camera.currency.rawValue)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(camera.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                }
            }
        }
        .task {
            await viewModel.getAllCameras()
        }
    }
}

@Observable
class DSLRsOverviewViewModel {
    
    private(set) var cameras: [Camera] = []
    
    func getAllCameras() async {
        do {
            let result = try await DslrApiClient(client: .init()).getAllCameras()
            cameras = result
        } catch {
            print(error)
        }
    }
}
