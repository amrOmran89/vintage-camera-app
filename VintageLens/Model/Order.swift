//
//  Order.swift
//  VintageLens
//
//  Created by Amr Omran on 29.09.25.
//

import Foundation

struct Order: Codable {
    let id: Int
    let seller: Seller
    let customer: Customer
    let totalAmount: Double
    let currency: Currency
    let status: OrderStatus
    let createdAt: String
    let shippingAddress: String
}

enum OrderStatus: String, Codable {
    case pending = "PENDING"
    case processing = "PROCESSING"
    case shipped = "SHIPPED"
    case delivered = "DELIVERED"
    case cancelled = "CANCELLED"
}
