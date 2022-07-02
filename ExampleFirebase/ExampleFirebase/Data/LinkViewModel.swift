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
    
    //func createNewNota(email: String){
    //linkRepository.newNota(email: email, nota: 1)}
    
    func createNewLink(FromURL url: String){
        linkRepository.createNewLink(withURL: url) { [weak self]
            result in
            switch result{
            case .success(_):
                //self?.links.append(link)
                print("✅ok")
            case .failure(let error):
                self?.MessageError = error.localizedDescription
            }
        }
    }
    
    func updateIsFavorite(link: LinkModel){
        let updateLink = LinkModel(id: link.id, URL: link.URL, isCompleted: link.isCompleted, isFavorite: link.isFavorite ? false:true, title: link.title)
        
        linkRepository.updateLink(link: updateLink)
    }
    
    func updateIsCompleted(link: LinkModel){
        let updateLink = LinkModel(id: link.id, URL: link.URL, isCompleted: link.isCompleted ? false:true, isFavorite: link.isFavorite, title: link.title)
        linkRepository.updateLink(link: updateLink)
    }
    
    func deleteLink(link: LinkModel)
    {
        linkRepository.deleteLink(link: link)
    }
}
