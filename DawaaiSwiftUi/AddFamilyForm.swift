//
//  AddFamilyForm.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 22/02/24.
//

import SwiftUI

struct AddFamilyForm: View {
    @State private var memberCode: String = ""
    @Binding public var familyMembers : [FamilyMember];
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let newMember : FamilyMember =         FamilyMember(id: 4, name: "Dadaji", image: "dad" , status: 1 , memberHisotry: [                    Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
                                                                                                                                                   ),
                                                                                                                                                                                                                                                           
                                                                                                                                              Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
                                                                                                                                                   ),

                                                                                                                                                                                                                                                           
                                                                                                                                              Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
                                                                                                                                                   ),

                                                                                                                                                                                                                                                           
                                                                                                                                              Medicine(id: 4, name: "Cinarest", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
                                                                                                                                                   )])


    var body: some View {
        ScrollView {
            VStack {
                Text("Join Family")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                
                
                Text("Enter Family Member's Code")
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.top, 100)
                  .padding(.horizontal,20)

                TextField("Type here", text: $memberCode)
                    .padding(.horizontal)
                    .padding(.top,10)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(50)

                Spacer()
                Spacer()

                Button("Add Member") {
                    print("Member code entered!")
                    print("member added")
                    familyMembers.append(newMember)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color("boColor"))
                .cornerRadius(8)
                .font(.system(size: 20, weight: .bold))
                .padding(.leading)
                // Add leading padding to entire VStack
                
//                VStack {
//                    Text("Instructions")
//                        .padding(.horizontal) // Move text 20 points to the left
//
//                    HStack {
//                        Image(systemName: "bulletpoint.circle")
//                            .foregroundColor(.green)
//                            .font(.system(size: 16))
//                            .frame(width: 20) // Offset bullet point to the left
//                        Text("1) Ask the family member to share their unique profile ID.")
//                            .font(.system(size: 18))
//                    }
//                    .padding(.horizontal, 20) // Indent content
//
//                    HStack {
//                        Image(systemName: "bulletpoint.circle")
//                            .foregroundColor(.green)
//                            .font(.system(size: 16))
//                            .frame(width: 20) // Offset bullet point to the left
//                        Text("2) Enter the unique profile ID and tap Add Member.")
//                            .font(.system(size: 18))
//                    }
//                    .padding(.horizontal, 20) // Indent content
//
//                    Spacer()
//                }
        
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading)
            .font(.system(size: 24))
            .bold()
        }
        .background(Color("bgColor"))
        
    }
}
