//
//  File.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/12/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

class DataProvider {
    
    init() {
        
    }
    
    static func provideUserRepository() -> UserRepository {
        return UserRepositoryImpl(local: LocalUserRepositoryImpl(), remote: RemoteUserRepositoryImpl())
    }
}
