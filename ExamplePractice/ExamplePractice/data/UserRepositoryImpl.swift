//
//  UserRepositoryImpl.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/11/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//

class UserRepositoryImpl: UserRepository {
    
    var mLocaRepo: UserRepository!
    var mRemoteRepo: UserRepository!
    
    init(local localRepo: LocalUserRepositoryImpl,remote remoteRepo: RemoteUserRepositoryImpl) {
        self.mLocaRepo = localRepo
        self.mRemoteRepo = remoteRepo
    }
    
    func getFriendList() -> [Friend] {
        // if local is empty then load remote
        let friendList = mLocaRepo.getFriendList()
        if !friendList.isEmpty {
            return friendList
        } else {
            return mRemoteRepo.getFriendList()
        }
    }
}
