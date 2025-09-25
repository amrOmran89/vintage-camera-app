//
//  BuildConfig.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import Foundation

class BuildConfig {
    
    static var baseUrl: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            return ""
        }
        return url
    }
}
