//
//  DataLoaderUtil.swift
//  ExamplePractice
//
//  Created by Vinh Tran on 7/12/17.
//  Copyright © 2017 Vinh Tran. All rights reserved.
//
import SwiftHTTP
import SwiftyJSON

class DataLoaderUtil {
    
    init() {
        
    }
    
    static func requestGET(_ url: String, callBack requestCallback: DataRequestCallback) {
        HTTP.GET(url) { response in
            if let err = response.error {
                print(">>> error: \(err.localizedDescription)")
                DispatchQueue.main.async {
                    requestCallback.onFailure()
                }
                return
            }
            
            // TODO: dispatch data to main thread
            DispatchQueue.main.async {
                requestCallback.onSuccess(jsonData: JSON(response.data))
            }
        }

    }
}

protocol DataRequestCallback {
    func onFailure()
    func onSuccess(jsonData dataResponse: JSON)
}
