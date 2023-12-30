//
//  Apptizer.swift
//  APIcall
//
//  Created by jay sabeen on 27/12/23.
//

import Foundation

struct Apptizer: Codable, Identifiable {
    let calories: Int
    let protein: Int
    let id: Int
    let carbs: Int
    let price: Double
    let description: String
    let name: String
    let imageURL: String
}

struct requestKey: Codable {
    let request: [Apptizer]
}

struct MockData {
    static let sampleApptizer = Apptizer(calories: 999, protein: 99, id: 001, carbs: 99, price: 99.9, description: "This description is yummy", name: "Test iTem", imageURL: "")
    static let sampleData = [sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer]
    static let orderItem1 = Apptizer(calories: 999, protein: 99, id: 001, carbs: 99, price: 99.9, description: "This description is yummy 11", name: "Test iTem order 1", imageURL: "")
    static let orderItem2 = Apptizer(calories: 999, protein: 99, id: 001, carbs: 99, price: 99.9, description: "This description is yummy 22", name: "Test iTem order 2", imageURL: "")
    static let orderItem3 = Apptizer(calories: 999, protein: 99, id: 001, carbs: 99, price: 99.9, description: "This description is yummy 33", name: "Test iTem order 3", imageURL: "")
    static let orders = [orderItem1, orderItem2, orderItem3]
}
