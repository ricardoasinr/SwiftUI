//
//  LinkDataSource.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import Foundation

import FirebaseFirestore
import FirebaseFirestoreSwift

struct LinkModel: Decodable, Identifiable, Encodable{
    @DocumentID var id: String?
    let URL: String
    let isCompleted: Bool
    let isFavorite: Bool
    let title: String
    
    
}

final class LinkDataSource {
    private let database = Firestore.firestore()
    private let collection = "links" //Nombre de la colección
    
    func getAllLinks(completionBlock: @escaping (Result <[LinkModel], Error>)->Void){
        database.collection(collection)
            .addSnapshotListener { query, error in
                if let error = error {
                    print("Error getting all links \(error.localizedDescription)")
                    completionBlock(.failure(error))
                    return
                }
                guard let documents = query?.documents.compactMap({$0}) else{
                    completionBlock(.success([]))
                    return
                }
                let links = documents.map{try? $0.data(as: LinkModel.self)}
                    .compactMap{$0}
                completionBlock(.success(links))
            }
    }
    
    func createNewlink(link: LinkModel, completionBlock: @escaping (Result <LinkModel, Error>)->Void){
        do{
            _ = try database.collection(collection).addDocument(from: link)
            completionBlock(.success(link))
        }
        catch{
            completionBlock(.failure(error))
        }
       
    }
    
    //func createNewNota(email: String, nota1: Int){
      //  database.collection("users").document(email).setData([
        //    "Nota1": nota1,
            
        //])
        
        
    //}
    
}
