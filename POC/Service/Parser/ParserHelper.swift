//
//  ParserHelper.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

 class ParserHelper {
     
     //MARK:- Parse Json From File
     static func parseJsonDataFromFile<T: Decodable>(data: Data?, error: Error?, responseData: URLResponse? = nil) throws -> APIResponse<T> {
         var parsedModel: APIResponse<T>
         var responseObject: T?, parseError: APIError?
         let decoder = JSONDecoder()
         
         if let value = String(data: data!, encoding: String.Encoding.ascii) {
             if let jsonData = value.data(using: String.Encoding.utf8) {
                 do {
                     let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: [])
                     let jsonObject = try JSONSerialization.data(withJSONObject: jsonResponse)
                     responseObject = try decoder.decode(T.self, from: jsonObject)
                 }
                 catch _ {
                     //throwing parse error when some decoding error occured.
                     parseError = APIError.parsingError
                 }
             }else{
                 throw parseError ?? APIError.parsingError
             }
         }
         
         if let reponseModel = responseObject {
             parsedModel = APIResponse<T>(data: reponseModel)
         } else {
             //throwing parse error
             throw parseError ?? APIError.parsingError
         }
         return parsedModel
     }
     
 }

