//
//  FamilyLogView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI




struct FamilyLogView : View {
    private var data :[Int] = Array(1...4)
    @State private var isAlertShowing = false
//    @State private var showAlertForMember: FamilyMember?
    @State private var familyMembers: [FamilyMember] = [
        FamilyMember(id: 1, name: "Dad", image: "dad" , status: 1 , memberHisotry: [                    Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),
                                                                                                        
                                                                                                        Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

                                                                                                        
                                                                                                        Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

                                                                                                        
                                                                                                        Medicine(id: 4, name: "Cinarest", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

]),
        FamilyMember(id: 2, name: "Mom", image: "mom" , status: 0 , memberHisotry: [                    Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
 ),
                                                                                                        
                                                                                                        Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill2"),

                                                                                                        
                                                                                                        Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

                                                                                                        
                                                                                                        Medicine(id: 4, name: "Cinarest", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),


]),
        FamilyMember(id: 3, name: "Didi", image: "didi" , status: 1 , memberHisotry: [                    Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),
                                                                                                          
                                                                                                          Medicine(id: 2, name: "Amodep AT", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

                                                                                                          
                                                                                                          Medicine(id: 3, name: "Amyron", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

                                                                                                          
                                                                                                          Medicine(id: 4, name: "Cinarest", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
),

]),
    ]
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("Family Log").font(.system(size: 25 , weight: .bold)).padding(20)
                    Spacer()
                    NavigationLink{
                        AddFamilyForm(familyMembers: $familyMembers)
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                    }
                    
                }
                
                LazyVGrid(columns: adaptiveColumns,spacing: 20){
                    ForEach(familyMembers){member in
                        NavigationLink{
                            MemberHistoryView(currMember: member)
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 170, height: 170)
                                    .foregroundColor(.white)
                                    .cornerRadius(30).shadow(radius: 10)
                                
                                VStack {
                                    Image(member.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 100, height: 100)
                                    HStack{
                                        
                                        Button(action: {
                                            isAlertShowing = true
                                        }) {
                                            Image(systemName: member.status == 1 ? "checkmark.circle.fill" : "bell")
                                                .foregroundColor(member.status == 1 ? .green : .red)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                          
                                            
                                            Text(member.name).padding(.horizontal , 10).foregroundColor(.black)
                                            Button(action: {
                                                guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                                UIApplication.shared.open(phoneNum)
                                            }) {
                                                Image(systemName: "phone.fill")
                                            }
                                           
                                        }
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                        }
                        
                        
                        
                    }
                    
                } .background(Color("bgColor")) // Set background color
                    .navigationBarTitle("Family Log", displayMode: .inline)
                    .navigationBarHidden(true)
                
        } .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top).sheet(isPresented: $isAlertShowing, content: {
            CustomAlertView(showing:$isAlertShowing)
        })
            
            //            .alert(isPresented: $isAlertShowing) {
            //                if let member = showAlertForMember {
            //                    return Alert(
            ////                        image: Image("dolo650"),
            //                        title: Text("hello"),
            //                        message: Text("🚨DAWAAI TIME🚨"),
            //                        primaryButton: .default(Text("DONE")) {
            //                            // Handle done action
            //                            isAlertShowing = false
            //                        },
            //                        secondaryButton: .cancel(Text("SNOOZE"))
            //                    )
            //                } else {
            //                    return Alert(
            //                        title: Text("hello"),
            //                        message: Text("🚨DAWAAI TIME🚨"),
            //                        primaryButton: .default(Text("DONE")) {
            //                            // Handle done action
            //                            isAlertShowing = false
            //                        },
            //                        secondaryButton: .cancel(Text("SNOOZE"))
            //                    )
            //                }}
    }
}
    


struct FamilyMember: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String // Name of the image file or URL
    let status : Int
    let memberHisotry : [Medicine]
}
    
    #Preview {
        FamilyLogView()
    }

