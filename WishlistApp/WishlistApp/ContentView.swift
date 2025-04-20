//
//  ContentView.swift
//  WishlistApp
//
//  Created by MacBookPro-Taamalli on 4/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var newWishTitle: String = ""
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions{
                            Button("Delete", role : .destructive){
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("WishList")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(
                            systemName: "plus"
                        )
                        .imageScale(.large)
                    }
                }
                
                if wishes.isEmpty != true {
                        ToolbarItem(placement: .bottomBar){
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
                
            }
            .alert("Create a new Wish", isPresented: $isAlertShowing){
                TextField("Enter a wish", text: $newWishTitle)
                Button{
                    modelContext.insert(Wish(title: newWishTitle))
                    newWishTitle = ""
                } label: {
                  Text("Save")
                }
             }
            .overlay{
                if wishes.isEmpty {
                    ContentUnavailableView("My Wish List", systemImage: "heart.circle",
                    description: Text("No description yet. Add one to get started!")
                    )
                }
            }
        }
    
    }
}

#Preview("List with Sample Data") {
  let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  
  container.mainContext.insert(Wish(title: "Master SwiftData"))
  container.mainContext.insert(Wish(title: "Buy a new iPhone"))
  container.mainContext.insert(Wish(title: "Practice latin dances"))
  container.mainContext.insert(Wish(title: "Travel to Europe"))
  container.mainContext.insert(Wish(title: "Make a positive impact"))
  
  return ContentView()
    .modelContainer(container)
}

#Preview("Empty List") {
  ContentView()
    .modelContainer(for: Wish.self, inMemory: true)
}
