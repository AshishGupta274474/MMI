//
//  DataService.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation

protocol DataServiceProtocol: AnyObject {
    func fetchAllValues<T: Decodable>(for key: String) -> [T]
    func update<T: Encodable>(_ values: [T], for key: String)
}

class DataService: DataServiceProtocol {
    
    public static let shared = DataService()
        
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let queue = DispatchQueue.init(label: "DataServiceQueue", attributes: .concurrent)
    
    func fetchAllValues<T: Decodable>(for key: String) -> [T] {
        var result: [T] = []
        queue.sync { [unowned self] in
            if let data = self.userDefaults.data(forKey: key) {
                do {
                    let tasks = try JSONDecoder().decode([T].self, from: data)
                    result.append(contentsOf: tasks)
                } catch {
                    print("Unable to Decode (\(error))")
                }
            }
        }
        return result
    }
    
    func update<T: Encodable>(_ values: [T], for key: String) {
        queue.async(flags: .barrier) { [unowned self] in
            do {
                let data = try JSONEncoder().encode(values)
                self.userDefaults.set(data, forKey: key)
            } catch {
                print("Unable to Encode (\(error))")
            }
        }
    }
}
