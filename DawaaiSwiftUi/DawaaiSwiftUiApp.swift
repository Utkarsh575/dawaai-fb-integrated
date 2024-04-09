//
//  DawaaiSwiftUiApp.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 10/01/24.
//

import SwiftUI
import UIKit
import FirebaseCore
import UserNotifications

@main

struct DawaaiSwiftUiApp: App {
    init() {
        FirebaseApp.configure()
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate{
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("launched")
    }
//    private func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async throws {
//        // Handle notification when app is in foreground
//        print("Received notification in foreground:", userInfo)
//        
//        // You can add logic to display an alert or update the UI based on notification content
//      }
//
//      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        if let launchOptions = launchOptions,
//           let notification = launchOptions[.remoteNotification] as? [AnyHashable: Any] {
//          handleNotification(notification: notification)
//        }
//        
//        // Request notification permissions (optional, adjust categories based on your notification types)
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
//          if granted {
//            print("Notifications permission granted")
//          } else {
//            print("Notifications permission denied")
//          }
//        }
//        
//        return true
//      }
//
//      func handleNotification(notification: [AnyHashable: Any]) {
//        guard let aps = notification["aps"] as? [String: Any],
//              let alert = aps["alert"] as? [String: Any],
//              let medicineId = alert["medicineId"] as? String else { return }
//        
//        // Fetch medicine details based on medicineId (replace with your logic)
//        // This could involve querying Firestore or local storage
//        var medicineInfo: [String: Any] = [:]
//        // ... (Your logic to fetch medicine details based on medicineId)
//        
//        openMedicineInfo(medicineInfo: medicineInfo)
//      }
//
//      func openMedicineInfo(medicineInfo: [String: Any]) {
//        if let medicine = Medicine(from: medicineInfo as! Decoder) {
//              // Use medicine object if successfully parsed
//              let medicineInfoView = MedicineInfo(medicine: medicine)
//              let hostingController = UIHostingController(rootView: medicineInfoView)
//                UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true)
//              // ... (Continue with navigation logic)
//          } else {
//              // Handle the case where medicine is nil (e.g., display an error message)
//              print("Error parsing medicine information")
//          }
//        
//      }
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
       if granted {
        print("Notification permission granted!")
       } else {
        print("Notification permission denied: \(error?.localizedDescription ?? "")")
       }
      }
       print("leaving app delegate");

      return true
     }
}



// CUSTOM TYPES
struct DawaaiUser {
    
    var email : String
    var uid : String
    var photo : URL?
    var username : String?
}


struct Medicine: Codable, Identifiable , Hashable {
    var id: Int // Unique identifier for the medicine
    var name: String
    var type: String
    var strength: String
    var strengthUnit: String
    var Image: String // Replace with actual image property name (consider using a URL or data for the image)
    var taken: Int
    var toBeTaken: Int
    var nextDoseTime: Date
    var dosageType: String
    var dosage: Int
    var quantity: Int
    var expiryDate: Date
    var startDate: Date
    var remindForReorder: Bool
    var breakfast: Bool
    var lunch: Bool
    var dinner: Bool
    var pillImage : String
}
