//
//  MedicineInfo.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import Foundation
import SwiftUI
import UserNotifications
struct MedicineInfo : View {
    @State public var medicine : Medicine;
    @State private var downlaodedImage : UIImage?
    @State private var reminder = true
    //    let imageUrlString = medicine.Image
    func getTimeFromTimestamp(timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short // Adjust format as needed (e.g., .medium, .long)
        return dateFormatter.string(from: date)
    }
    
    func timestampToDateString(timestamp: Double, outputFormat: String = "dd/MM/yy") -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat // Set custom format
        return dateFormatter.string(from: date)
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?, Error?) -> Void) {
        guard let imageUrl = URL(string: urlString) else {
            completion(nil, NSError(domain: "InvalidImageUrl", code: 1, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil, NSError(domain: "FailedToCreateImage", code: 2, userInfo: nil))
                return
            }
            
            completion(image, nil)
        }.resume()
    }
    
    var body: some View {
        ScrollView{
            //            Button(action: {
            //              // Define notification content
            //                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            //                    if success {
            //                        print("All set!")
            //                    } else if let error {
            //                        print(error.localizedDescription)
            //                    }
            //                }
            //
            //              let content = UNMutableNotificationContent()
            //              content.title = "Button Tapped!"
            //              content.body = "You tapped the notification button."
            //              content.sound = UNNotificationSound.default
            //
            //              // Schedule notification immediately
            //              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false) // One-time notification after 1 second
            //
            //              // Create and schedule notification request
            //              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            //              UNUserNotificationCenter.current().add(request ) { (error) in
            //                if let error = error {
            //                  print("Error scheduling notification:", error.localizedDescription)
            //                } else {
            //                  print("Notification scheduled successfully!")
            //                }
            //              }
            //            }) {
            //              Text("Tap for Notification")
            //            }
            
//            VStack{
//                
//                HStack{
//                    
//                    if(medicine.Image.count < 15){
//                        Image("dolo650").rotationEffect(.degrees(90))
//                    }else{
//                        if let image = downlaodedImage {
//                            Image(uiImage: image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                        } else {
//                            ProgressView()
//                                .progressViewStyle(.circular)
//                        }
//                    }
//                    
//                    
//                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment:.center).background(Color("heroColor")).border(Color("boColor"), width: 4 ).cornerRadius(15.0).shadow(radius: 3).onAppear{
//                    downloadImage(from: medicine.Image) { image, error in
//                        if let error = error {
//                            print("Error downloading image:", error)
//                        } else {
//                            downlaodedImage = image
//                        }
//                        
//                    }
//                }
//                VStack{
//                    
//                    Text("Pill name").font(.system(size: 15,weight: .medium)).frame(maxWidth: .infinity ,alignment : .leading).padding(.leading , 5);
//                    
//                    
//                    Text(medicine.name).font(.system(size: 30,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .leading).padding(10).background(Color.bgMed);
//                    
//                    
//                    Text("Strength").font(.system(size: 15,weight: .medium)).frame(maxWidth: .infinity ,alignment : .leading).padding(.leading , 5);
//                    
//                    
//                    Text("\(String(medicine.strength)) \(String(medicine.strengthUnit))").font(.system(size: 30,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .leading).padding(10).background(Color.bgMed);
//                    
//                    Text("Next reminder").font(.system(size: 15,weight: .medium)).frame(maxWidth: .infinity ,alignment : .leading).padding(.leading , 5);
//                    
//                    
//                    Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .semibold)).frame(maxWidth: .infinity ,alignment : .leading).padding(10).background(Color.bgMed);
//                    
//                    
//                }.padding(.top,10).padding(.bottom , 20)
//                Text("Pill dosage").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top, 5);
//                
//                
//                Text(String(medicine.dosage)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(10).background(Color.bgMed);
//                
//                Text("Dosage timing").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                
//                Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(10).background(Color.bgMed)
//                
//                Text("Quantity").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                
//                
//                Text("Total \(String(medicine.quantity)) remaining").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(9).background(Color.bgMed);
//                
//                
//                Text("Expiry Date").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                
//                
//                Text(timestampToDateString(timestamp: medicine.expiryDate.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(10).background(Color.bgMed);
//                
//                Text("Starting Date").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                
//                
//                Text(timestampToDateString(timestamp: medicine.startDate.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(10).background(Color.bgMed);
//                
//                ZStack {
//                    Text("Remind for Reorder").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                }
//                
//                if(medicine.remindForReorder == true){
//                    Text("Yes").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(10).background(Color.bgMed);
//                }
//                else{
//                    Text("No").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).background(Color.bgMed);
//                }
//                
//                
//                
//                
//                Text("Dosage Instruction").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 2)
//                
//                
//                Text(medicine.dosageType).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).background(Color.bgMed);
//                
//                
//                
//                Text("Dosage Timings").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
//                HStack{
//                    
//                    if(medicine.breakfast){
//                        Text("BreakFast").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).background(Color.bgMed);
//                        
//                    }
//                    
//                    if(medicine.lunch){
//                        Text("Lunch").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).background(Color.bgMed);
//                        
//                    }
//                    
//                    if(medicine.dinner){
//                        Text("Dinner").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).background(Color.bgMed);
//                        
//                    }
//                }.padding(.top,5)
//                
//                
//                
//                
//            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            
            VStack{
                
                HStack{
               
                                   if(medicine.Image.count < 15){
                                       Image("dolo650").rotationEffect(.degrees(90))
                                   }else{
                                       if let image = downlaodedImage {
                                           Image(uiImage: image)
                                               .resizable()
                                               .aspectRatio(contentMode: .fit)
                                       } else {
                                           ProgressView()
                                               .progressViewStyle(.circular)
                                       }
                                   }
               
               
                }.frame(maxWidth: .infinity , alignment:.center).background(Color("heroColor")).border(Color("boColor"), width: 4 ).cornerRadius(15.0).shadow(radius: 3).padding(15).onAppear{
                                   downloadImage(from: medicine.Image) { image, error in
                                       if let error = error {
                                           print("Error downloading image:", error)
                                       } else {
                                           downlaodedImage = image
                                       }
               
                                   }
                               }
                
            }
            VStack{
                HStack {
                    if medicine.breakfast {
                        Text("Breakfast")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.all, 10)
                            .background(Color.bgMed)
                            .clipShape(RoundedRectangle(cornerRadius: 10)).font(.system(size:17,weight: .semibold))
                    }
                }
                .frame(maxWidth:100, maxHeight: .infinity, alignment: .top).padding(.leading,-175) // Align HStack top-left
                
                Text(medicine.name).padding(.leading,25).padding(.top,20).font(.system(size:40,weight: .bold)).frame(maxWidth: .infinity,alignment: .leading)
                HStack{
                    HStack{
                        Image("clock").resizable()
                            .frame(width: 20.0, height: 20.0)
                        Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970))
                        
                    }.padding(.leading,25)
                    Spacer()
                    HStack{
                           Image("pillIcon").resizable()
                               .frame(width: 20.0, height: 20.0)
                           Text(medicine.dosageType)
                    }
                

                }/*.padding(.leading,-100)*/.frame(maxWidth: .infinity,alignment: .leading).padding(.trailing,120)

                
            }
            
            Rectangle()
                .frame(width: 300, height: 1)
                .foregroundColor(Color.gray).padding(.top,20)
            
            HStack{
                VStack{
                    
                    Text(timestampToDateString(timestamp: medicine.startDate.timeIntervalSince1970)).font(.system(size: 17,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(10)
                    Text("Start Date").font(.system(size: 12))
                    
                }
                VStack{
                    
                    Text(timestampToDateString(timestamp: medicine.expiryDate.timeIntervalSince1970)).font(.system(size: 17,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(10)
                    Text("Expiry Date").font(.system(size: 12))
                    
                }
               
                
            }
            
            Rectangle()
                .frame(width: 300, height: 1)
                .foregroundColor(Color.gray).padding(.top,20)
//            
//            VStack{
//                
//                Text(String(medicine.quantity)).font(.system(size: 17,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(10)
//                Text("Quantity").font(.system(size: 12))
//                
//            }
            HStack{
                Text("Quantity")
                Text(String(medicine.quantity))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.all, 10)
                    .background(Color.bgMed)
                    .clipShape(RoundedRectangle(cornerRadius: 10)).font(.system(size:17,weight: .semibold))
                Spacer()
                Spacer()
                Text("Dosage")
                Text(String(medicine.dosage))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.all, 10)
                    .background(Color.bgMed)
                    .clipShape(RoundedRectangle(cornerRadius: 10)).font(.system(size:17,weight: .semibold))
            }.frame(maxWidth:300, maxHeight: .infinity, alignment: .top).padding(.leading,-5).padding(.top,10)
            
            Rectangle()
                .frame(width: 300, height: 1)
                .foregroundColor(Color.gray).padding(.top,20)
            
            HStack{
                Text("Reminders for order:").font(.system(size: 20,weight: .medium))
                if(medicine.remindForReorder == true){
                    Text("YES").font(.system(size: 20,weight: .bold))
                }
                else{
                    Text("NO").font(.system(size: 20,weight: .bold))
                }
            }.frame(maxWidth:300, maxHeight: .infinity, alignment: .top).padding(.leading,-5).padding(.top,10)
            
            
//            HStack{
//                VStack{
//                    
//                    Text(String(medicine.quantity)).font(.system(size: 17,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(10)
//                    Text("Quantity").font(.system(size: 12))
//                    
//                }
//                VStack{
//                    
//                    Text(String(medicine.dosage)).font(.system(size: 17,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .center).padding(10)
//                    Text("Dosage per day").font(.system(size: 12))
//                    
//                }
//               
//                
//            }
//           
            
        }.background(Color("bgColor")).onAppear{
            print("selected med ",medicine)
            
        }
        
    }
}


#Preview{
   MedicineInfo(medicine: Medicine(id: 1, name: "Dolo 650", type: "pill", strength: "650", strengthUnit: "mg", Image: "pill\(String(Int.random(in: 1...3)))", taken: 2, toBeTaken: 3, nextDoseTime: Date(timeIntervalSince1970: 1708529400), dosageType: "Before eating", dosage: 3 , quantity: 10 , expiryDate: Date(timeIntervalSince1970: 1711305000) , startDate: Date() , remindForReorder:true, breakfast: true , lunch: false , dinner: true, pillImage: "pill1"
                          ))
}

