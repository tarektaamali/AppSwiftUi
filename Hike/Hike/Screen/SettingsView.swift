//
//  SettingsView.swift
//  Hike
//
//  Created by MacBookPro-Taamalli on 4/19/25.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons : [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        ]
    
    
    var body: some View {
        
        List {
            
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black
                                     ))
                    
                    VStack(spacing : -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack (spacing: 8,){
                    Text("where you can find perfect trails")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeau in photos but is even more beautiful is actually there. The hike which looks easy but is actually challenging is actually there. find the best hike in your area.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off The boots and hit the trails! It's Time for walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom , 16)
                .frame(maxWidth: .infinity)
                
            }
            .listRowSeparator(.hidden)
            
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing : 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon\(alternateAppIcons[item]) was Tapped")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                    error  in
                                    if error != nil {
                                            print("Fail to set alternate icon")
                                    } else{
                                        print("Success")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
                
            }
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("About The App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © 2025. All rights reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic Labeled Content
                // LabeledContent("Application", value :"Hike")
                // 2. Advanced Labeled Content
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Hike",
                    rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Comptability", rowIcon: "info.circle", rowContent: "IOS, iPadOS, macOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0.0", rowTintColor: .gray)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Tarek Taamalli", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Alpha", rowTintColor: .pink)
                
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowContent: nil,
                    rowTintColor: .pink,
                    rowLinkLabel: "taamali.com",
                    rowLinkDestination: "https://www.taamali.com"
                )
                
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
