//
//  MetaData.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 1/7/22.
//

import Foundation
import LinkPresentation

enum CustomError: Error{
    case badURL
    
}

final class MetaDataDataSource {
    private var metadataProvider : LPMetadataProvider? = nil
    
    func getMetaData(FromURL url: String, completionBlock:  @escaping (Result <LinkModel, Error>)->Void ){
        guard let url = URL(string: url) else{
            completionBlock(.failure(CustomError.badURL))
            return
        }
        metadataProvider = LPMetadataProvider()
        metadataProvider?.startFetchingMetadata(for: url, completionHandler: { Metadata, error in
            if let error = error {
                print("Error getting data \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let linkModel = LinkModel(URL: url.absoluteString, isCompleted: false, isFavorite: false, title: Metadata?.title ?? "No hay titulo")
            
            completionBlock(.success(linkModel))
        })
    }
    
}
