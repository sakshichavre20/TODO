//
//  Extensions.swift
//  Learn
//
//  Created by Sakshi Chavre on 28/05/24.
//

import Foundation

extension Encodable {
    func asDict() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
        
    }
}
