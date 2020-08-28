//
//  POCHttpClient.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class POCHttpClient {
    
    let apiResource: APIResource!
    let decoder = JSONDecoder()
    
    init(resource: APIResource?) {
        self.apiResource = resource
    }
    
    
    func sendRequest<T: Decodable>(completion: APICompletion<T>?) {
       
        guard let url = URL(string: apiResource.urlString) else {
            Loader.dismissLoader()
            let alertController = UIAlertController(title: "Alert", message: "Problem with network request URL. please try later", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            }))
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.apiResource.method.rawValue
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            let result: DataResult<T>
            
            do {
                if data != nil {
                    let parseResult: APIResponse<T> = try ParserHelper.parseJsonDataFromFile(data: data, error: error, responseData: response)
                    
                    result = DataResult.success(parseResult)
                    DispatchQueue.main.async {
                        completion?(result)
                    }
                }else {
                    Loader.dismissLoader()
                }
            } catch {
            }
        }
        task.resume()
        
    }
    
}
