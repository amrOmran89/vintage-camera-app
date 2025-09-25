//
//  DiscoverCoordinator.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import SwiftUI

@Observable
class DiscoverCoordinator {
    
    var path: [Screens] = []
    
    enum Screens: Hashable {
        case details(Vintage)
        case checkout(Vintage)
        case thankYou(Vintage)
        case vintageOverview
        case brandsOverview
        case lensesOverview
    }
    
    func push(_ screen: Screens) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    @ViewBuilder
    func goToView(_ screen: Screens) -> some View {
        switch screen {
        case .details(let camera):
            CameraDetailsView(camera: camera)
        case .checkout(let camera):
            CheckoutView(camera: camera)
        case .thankYou(let camera):
            OrderConfirmationView(camera: camera)
        case .vintageOverview:
            VintageOverview()
        case .brandsOverview:
            BrandsOverView()
        case .lensesOverview:
            LensesOverview()
        }
    }
}
