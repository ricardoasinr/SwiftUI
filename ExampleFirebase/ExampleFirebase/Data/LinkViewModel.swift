//
//  LinkViewModel.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import Foundation

final class LinkViewModel: ObservableObject{
    @Published var links: [LinkModel] = []
    @Published var MessageError: String?
    
    private let linkRepository: LinkRepository
    
    init (linkRepository: LinkRepository = LinkRepository()){
        self.linkRepository = linkRepository
    }
    
    func getAllLinks(){
        linkRepository.getAllLinks {
            [weak self]
            result in
            switch result{
                
            case .success(let linkModels):
                self?.links = linkModels
                
            case .failure(let error):
                self?.MessageError = error.localizedDescription
                
            }
        }
    }
    
    func createNewNota(email: String){
        linkRepository.newNota(email: email, nota: 1)
        
    }
}
