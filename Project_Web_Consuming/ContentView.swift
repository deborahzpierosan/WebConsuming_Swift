//
//  ContentView.swift
//  Project_Web_Consuming
//
//  Created by Foundation09 on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var characterCard: General?
    
    func getCharacter() async -> General? {
        if let url = URL(string: "https://rickandmortyapi.com/api/character"){
            let request = URLRequest(url: url)
            if let (data,_) = try? await  URLSession.shared.data(for:request){
                do {
                    let fecthedData = try JSONDecoder().decode(General.self, from: data)
                    return fecthedData
                }
                catch {
                    print(error)
                }
                
//                let fecthedData = try? JSONDecoder().decode(General.self, from: data)
//                print(fecthedData)
//                return fecthedData
            }
        }
        return nil
    }
    var body: some View {
        VStack {
            if let characterCard {
                ScrollView{
                ForEach(characterCard.results, id:\.id){ result in
                    HStack{
                        //AsyncImage(result.image)
                        Spacer()
                        AsyncImage(url: URL(string: result.image))
                        {image in image.image?
                                .resizable()
                                .frame(width: 200,height: 200)
                            .position(x:100)}
                        Text(result.name)
                            .multilineTextAlignment(.leading)
                            .position(x:110)
                        
                    }
                }
            }
        }
    }
        .padding()
        .task{
            self.characterCard = await getCharacter()
        }
    }
}

#Preview {
    ContentView()
}
