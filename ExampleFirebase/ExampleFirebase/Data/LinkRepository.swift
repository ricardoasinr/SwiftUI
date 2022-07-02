//
//  LinkRepository.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import Foundation
//import FirebaseMLModelDownloader


final class LinkRepository{
    private let linkDataSource: LinkDataSource
    private let metaDataDataSource: MetaDataDataSource
    
    init(linkDataSource: LinkDataSource = LinkDataSource(),
         metaDataDataSource: MetaDataDataSource = MetaDataDataSource()){
        self.linkDataSource = linkDataSource
        self.metaDataDataSource = metaDataDataSource
    }
    
    func getAllLinks(completionBlock: @escaping (Result <[LinkModel], Error>)->Void){
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }
    
    //func newNota(email: String, nota: Int){
        //linkDataSource.createNewNota(email: email, nota1: nota)
    //}
    
    func createNewLink(withURL url: String, completionBlock:  @escaping (Result <LinkModel, Error>)->Void ){
        //metaDataDataSource.getMetaData(FromURL: url, completionBlock: completionBlock)
        metaDataDataSource.getMetaData(FromURL: url) { [weak self]
            result in
            switch result{
            case .success(let linkModel):
                self?.linkDataSource.createNewlink(link: linkModel, completionBlock: completionBlock)
                
            case .failure(let error):
                completionBlock(.failure(error))
            }
        }
    }
    
    func updateLink(link: LinkModel){
        linkDataSource.updateLink(link: link)
    }
    
    func deleteLink(link: LinkModel)
    {
        linkDataSource.deleteLink(link: link)
    }
    
    
    
    
    
}
