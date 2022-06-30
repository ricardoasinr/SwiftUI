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
    init(linkDataSource: LinkDataSource = LinkDataSource()){
        self.linkDataSource = linkDataSource
    }
    
    func getAllLinks(completionBlock: @escaping (Result <[LinkModel], Error>)->Void){
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }
    
    //func newNota(email: String, nota: Int){
        //linkDataSource.createNewNota(email: email, nota1: nota)
    //}
    
    
}
