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

            VStack{
                
                Text(medicine.name)
                
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
                    
             
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment:.center).background(Color("heroColor")).border(Color("boColor"), width: 4 ).cornerRadius(25.0).shadow(radius: 3).onAppear{
                    downloadImage(from: medicine.Image) { image, error in
                        if let error = error {
                            print("Error downloading image:", error)
                        } else {
                            downlaodedImage = image
                        }
                        
                    }
                }
                VStack{
                    
                    Text("Pill name").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                    

                    Text(medicine.name).font(.system(size: 30,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                    
                    
                    Text("Strength").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                    

                    Text("\(String(medicine.strength)) \(String(medicine.strengthUnit))").font(.system(size: 30,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                    
                    Text("Next reminder").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                    

                    Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .semibold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                    
                }.padding(.top,20).padding(.bottom , 20)
                Text("Pill dosage").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top, 5);
                

                Text(String(medicine.dosage)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                Text("Dosage timing").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)

                Text(getTimeFromTimestamp(timestamp: medicine.nextDoseTime.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5)
               
                Text("Quantity").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text("Total \(String(medicine.quantity)) remaining").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                
                Text("Expiry Date").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text(timestampToDateString(timestamp: medicine.expiryDate.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                Text("Starting Date").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)


                Text(timestampToDateString(timestamp: medicine.startDate.timeIntervalSince1970)).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                
                Text("Remind for Reorder").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
                
                if(medicine.remindForReorder == true){
                    Text("Yes").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                }
                else{
                    Text("No").font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);
                }
                
                
                
                
                Text("Dosage Instruction").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 2)


                Text(medicine.dosageType).font(.system(size: 25,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                
                
                Text("Dosage Timings").font(.system(size: 15,weight: .medium)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5).padding(.top , 5)
                HStack{
                    
                    if(medicine.breakfast){
                        Text("BreakFast").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                    }
                    
                    if(medicine.lunch){
                        Text("Lunch").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                    }
                    
                    if(medicine.dinner){
                        Text("Dinner").font(.system(size: 18,weight: .bold)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment : .leading).padding(.leading , 5);

                    }
                }.padding(.top,5)

                

                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .center).padding(10).padding(.horizontal,10)
            

        }.background(Color("bgColor")).onAppear{
            print("selected med ",medicine)

        }


    }
}

