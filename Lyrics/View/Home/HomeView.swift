//
//  HomeView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    let user: User?

    var body: some View {
        if let uuid = UUID(uuidString: user?.id.uuidString ?? "nil") {
            HomeContentView(userId: uuid)
        } else {
            Text("Erro: ID de usuário inválido")
        }
    }
}

struct HomeContentView: View {
    @Query var users: [User]
    
    init(userId: UUID) {
        _users = Query(filter: #Predicate<User> { user in
            user.id == userId
        })
    }
    
    var currentUser: User? { users.first }

    var body: some View {
        TabView {
            SongsListView(currentUser: currentUser)
                .tabItem { Label("Músicas", systemImage: "music.note") }
            
            FavoriteSongsView()
                .tabItem { Label("Favoritos", systemImage: "star") }
        }
    }
}

#Preview {
    HomeView(user: nil)
}
