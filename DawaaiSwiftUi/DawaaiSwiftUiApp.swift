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
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("launched")
    }

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
  // ... other app delegate methods
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

//    init(id: String, name: String, type: String, strength: String, strengthUnit: String, image: String, taken: Int, toBeTaken: Int, nextDoseTime: Date, dosageType: String, dosage: Int, quantity: Int, expiryDate: Date, startDate: Date, remindForReorder: Bool, breakfast: Bool, lunch: Bool, dinner: Bool) {
//        self.id = id
//        self.name = name
//        self.type = type
//        self.strength = strength
//        self.strengthUnit = strengthUnit
//        self.image = image
//        self.taken = taken
//        self.toBeTaken = toBeTaken
//        self.nextDoseTime = nextDoseTime
//        self.dosageType = dosageType
//        self.dosage = dosage
//        self.quantity = quantity
//        self.expiryDate = expiryDate
//        self.startDate = startDate
//        self.remindForReorder = remindForReorder
//        self.breakfast = breakfast
//        self.lunch = lunch
//        self.dinner = dinner
//    }

    // Alternatively, if you're fetching data from a dictionary:
//    init?(from data: [String: Any]) {
//        guard let id = data["id"] as? String,
//              let name = data["name"] as? String,
//              let type = data["type"] as? String,
//              let strength = data["strength"] as? String,
//              let strengthUnit = data["strengthUnit"] as? String,
//              let image = data["image"] as? String,
//              let taken = data["taken"] as? Int,
//              let toBeTaken = data["toBeTaken"] as? Int,
//              let nextDoseTime = data["nextDoseTime"] as? String,
////              let nextDoseTime = Firestore.firestore().date(from: nextDoseTimeString),
//              let dosageType = data["dosageType"] as? String,
//              let dosage = data["dosage"] as? Int,
//              let quantity = data["quantity"] as? Int,
//              let expiryDate = data["expiryDate"] as? String,
////              let expiryDate = Firestore.firestore().date(from: expiryDateString),
//              let startDate = data["startDate"] as? String,
////              let startDate = Firestore.firestore().date(from: startDateString),
//              let remindForReorder = data["remindForReorder"] as? Bool,
//              let breakfast = data["breakfast"] as? Bool,
//              let lunch = data["lunch"] as? Bool,
//              let dinner = data["dinner"] as? Bool else {
//            return nil // Handle cases where data is missing or invalid
//        }
//
//        self.id = id
//        self.name = name
//        self.type = type
//        self.strength = strength
//        self.strengthUnit = strengthUnit
//        self.image = image
//        self.taken = taken
//        self.toBeTaken = toBeTaken
//        self.nextDoseTime = Date( timeIntervalSince1970: TimeInterval(Int(nextDoseTime) ?? 123456789))
//        self.dosageType = dosageType
//        self.dosage = dosage
//        self.quantity = quantity
//        self.expiryDate = Date( timeIntervalSince1970: TimeInterval(Int(expiryDate) ?? 123456789))
//
//        self.startDate = Date( timeIntervalSince1970: TimeInterval(Int(startDate) ?? 123456789))
//
//        self.remindForReorder = remindForReorder
//        self.breakfast = breakfast
//        self.lunch = lunch
//        self.dinner = dinner
//    }
}
