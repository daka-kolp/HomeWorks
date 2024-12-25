//
//  PlaylistModesModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistModesModelDelegate: AnyObject {
    func dataDidLoad()
}

class PlaylistModesModel {
    
    weak var delegate: PlaylistModesModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var all: [Song] = []
    var songsByGenre: [SongsByGenre] = []
    var songsByAuthor: [SongsByAuthor] = []
    
    func loadData() {
        dataLoader.loadPlaylist { playlist in
            let items = playlist?.songs ?? []
            
            self.all = items
            
            for song in items {
                if let index = self.songsByGenre.firstIndex(where: {$0.title == song.genre}) {
                    let item = self.songsByGenre[index]
                    self.songsByGenre[index] = SongsByGenre(title: song.genre, songs: item.songs + [song])
                } else {
                    self.songsByGenre.append(SongsByGenre(title: song.genre, songs: [song]))
                }
                
                
                if let index = self.songsByAuthor.firstIndex(where: {$0.author == song.author}) {
                    let item = self.songsByAuthor[index]
                    self.songsByAuthor[index] = SongsByAuthor(author: song.author, songs: item.songs + [song])
                } else {
                    self.songsByAuthor.append(SongsByAuthor(author: song.author, songs: [song]))
                }
            }
            
            self.delegate?.dataDidLoad()
        }
    }
}
