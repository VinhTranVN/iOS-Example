//
//  LocalUserRepositoryImpl.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/11/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//
import UIKit

class LocalUserRepositoryImpl : UserRepository {
    func getFriendList() -> [Friend] {
        // dummy data
        guard let friend1 = Friend(userName: "tramng", fullName: "Tram Nguyen", photoUrl: nil,photoView: UIImage(named:"girl_snipper")) else {
            fatalError("Unable to instantiate friend1")
        }
        
        guard let friend2 = Friend(userName: "duyle", fullName: "Le Ngoc Duy", photoUrl: nil, photoView: UIImage(named: "soldier")) else {
            fatalError("Unable to instantiate friend2")
        }
        return [friend1, friend2]
    }
}
