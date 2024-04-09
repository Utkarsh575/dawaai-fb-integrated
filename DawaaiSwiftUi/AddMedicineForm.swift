//
//  AddMedicineForm.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore


struct ImagePicker: UIViewControllerRepresentable {
  @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>


  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker
      let presentationMode: Binding<PresentationMode>

      init(_ parent: ImagePicker, presentationMode: Binding<PresentationMode>) {
        self.parent = parent
        self.presentationMode = presentationMode
      }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        parent.image = uiImage
      }
      presentationMode.wrappedValue.dismiss()
    }
  }
  
    func makeCoordinator() -> Coordinator {
      Coordinator(self, presentationMode: presentationMode)
    }


  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true // Allow editing the selected image (optional)
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

  }
}


struct AddMedicineForm: View {
    //    @Binding public var medicineCards : [Medicine]
    
    @State public var medicine : Medicine = Medicine(id: Int.random(in: 1...100) , name: "", type: "", strength: "", strengthUnit: "", Image: "pill1", taken: 0, toBeTaken: 3, nextDoseTime: Date().addingTimeInterval(200), dosageType: "", dosage: 0, quantity: 0 , expiryDate: Date() , startDate: Date(), remindForReorder: false , breakfast: false , lunch: false , dinner: false, pillImage: "pill1") ;
    
    @State private var showingDatePicker : Bool = false
    @State private var showingDatePicker2 : Bool = false
    
    @State private var isShowingImagePicker : Bool = false
    @State private var inputImage: UIImage?
    
    @State private var image: Image?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
//     var lmaoded : FirestoreManager  = FirestoreManager()
//    @StateObject private var lmaoded = fsm2()
//    public var lmaoded = fsm2()
    @StateObject public var lmaoded = fsm2()
    var body: some View {
        
        
        NavigationStack{
            
            Form(content: {
                Section(header:
                            Text("Add A Medicine Plan").bold()
                ){
                    TextField("Name", text: $medicine.name).foregroundColor(.black).autocorrectionDisabled()
                    TextField("Type", text: $medicine.type).autocorrectionDisabled()

                        .foregroundColor(.black)
                    
                    TextField("Strength", text: $medicine.strength).autocorrectionDisabled()
                        .keyboardType(.numberPad)
                        .foregroundColor(.black)
                    
                    TextField("Strength Unit", text: $medicine.strengthUnit)
                        .foregroundColor(.black).autocorrectionDisabled()
                    
                    //                    TextField("Quantity", text: $medicine.quantity ).keyboardType(.numberPad)
                    //                                                                                            .foregroundColor(.black)
                    
                    HStack{
                        Text("Quantity")
                        Stepper("\(String(medicine.quantity))", value: $medicine.quantity )
                    }
                    Toggle("Remind for reorder?" , isOn: $medicine.remindForReorder )
                    HStack{
                        Text("Dosage per day")
                        Stepper("\(String(medicine.dosage))", value: $medicine.dosage )
                    }
                    
                    HStack {
                        Text("Medicine Expiry Date")
                        Spacer()
                        Button("Select") {
                            showingDatePicker.toggle()
                        }
                        
                    }
                    
                    if showingDatePicker {
                        
                        DatePicker("", selection: $medicine.expiryDate, displayedComponents: .date).foregroundColor(.black)
                    }
                    
                    
                    HStack {
                        Text("Plan Start Date")
                        Spacer()
                        Button("Select") {
                            showingDatePicker2.toggle()
                        }
                    
                    }
                    
                    if showingDatePicker2 {
                        
                        DatePicker("", selection: $medicine.startDate, displayedComponents: .date).foregroundColor(.black)
                    }
                    
                }
                
                Section(header: Text("Dosage Instructions")) {
                    TextField("Dosage Type", text: $medicine.dosageType).foregroundColor(.black).autocorrectionDisabled()
                    Toggle("Breakfast" , isOn: $medicine.breakfast)
                    Toggle("Lunch" , isOn: $medicine.lunch)
                    Toggle("Dinner" , isOn: $medicine.dinner)
                    
                }
                
//                Button("Open Camera") {
//                    self.isShowingImagePicker = true
//                }
//                .sheet(isPresented: $isShowingImagePicker,onDismiss: uploadImage) {
//                    ImagePicker(image: self.$inputImage)
//                }
                Button("Open Photos") {
                    isShowingImagePicker = true
                }
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(image: self.$inputImage)
                }
                
            
                Button("Save"){
                    handleSave()
                    print("pressed save")
                }
                
            })
        }
        
        
    }
    
    func handleSave (){
        lmaoded.uploadMedicineImage(image: inputImage!) { url in
            if let url = url {
                medicine.Image = url
                print("Image uploaded successfully! URL:", url)
                print("medicine data with image url: \(medicine)")

                lmaoded.uploadData(newMed: medicine)
                let a = FirestoreManager()
                a.fetchMedicines()
                self.presentationMode.wrappedValue.dismiss()

            } else {
                print("Error uploading image")
            }
            
        }
        
        

    }
    //    func loadImage() {
    //        guard let inputImage = inputImage else { return }
    //        image = Image(uiImage: inputImage)
    //    }
    //
    //
    

    
    
}


    
    
    
    class fsm2 : ObservableObject {
        // Add Firebase Storage references (storage, storageRef)
 
       @State public var newMedicine : Medicine? = nil
       @State public var exisitingMedicines : [Medicine] = []
        
        func uploadMedicineImage(image: UIImage, completion: @escaping (String?) -> Void) {
            guard let imageData = image.jpegData(compressionQuality: 0.75) else {
                completion(nil)
                return
            }
            //            print(imageData)
            let storage = Storage.storage()
            let storageRef = storage.reference()
            let imageRef = storageRef.child("med_images/\(UUID().uuidString).jpg")
            
            imageRef.putData(imageData, metadata: nil) { metadata , error in
                if let error = error {
                    print("Error uploading image to Firestore Storage:", error.localizedDescription)
                    completion(nil)
                    return
                }
                
                imageRef.downloadURL { url, error in
                    if let error = error {
                        print("Error getting image URL:", error.localizedDescription)
                        completion(nil)
                        return
                    }
                    
                    guard let url = url?.absoluteString else {
                        print("Failed to retrieve image URL")
                        completion(nil)
                        return
                    }
                    
                    completion(url)
                }
            }
        }
        
        func uploadData ( newMed : Medicine?){
            let db = Firestore.firestore()
            let docRef = db.collection("Users").document("o3VXdqMV47PpRXaZmPyuQUzFhyh2")
            
            docRef.getDocument{ (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                
                if let document = document, document.exists{
                    guard var data = document.data() else {
                        print("No data found in document")
                        return
                    }
                    
                    // Update medicines data
                    if var medicinesData = data["medicines"] as? [[String: Any]] {
                        // Add new medicine to existing data
                        if let newMedicine = newMed {
                            medicinesData.append([
                                "name": newMedicine.name,
                                "type": newMedicine.type,
                                "strength": newMedicine.strength,
                                "strengthUnit": newMedicine.strengthUnit,
                                "Image": newMedicine.Image,
                                "taken": newMedicine.taken,
                                "toBeTaken": newMedicine.toBeTaken,
                                "nextDostTime": newMedicine.nextDoseTime.timeIntervalSince1970, // Convert to timestamp
                                "dosageType": newMedicine.dosageType,
                                "dosage": newMedicine.dosage,
                                "quantity": newMedicine.quantity,
                                "expiryDate": newMedicine.expiryDate.timeIntervalSince1970, // Convert to timestamp
                                "startDate": newMedicine.startDate.timeIntervalSince1970, // Convert to timestamp
                                "remindForReorder": newMedicine.remindForReorder,
                                "breakfast": newMedicine.breakfast,
                                "lunch": newMedicine.lunch,
                                "dinner": newMedicine.dinner,
                                "pillImage": newMedicine.pillImage
                            ])
                        }
                        
                        data["medicines"] = medicinesData
                    }
//                    } else {
//                        // No existing medicines data, create a new array
//                        data["medicines"] = [
//                            [
//                                "name": newMed?.name ?? "", // Handle potential nil value for new medicine name
//                                "type": newMed?.type ?? "",
//                                "strength": newMed?.strength ?? "",
//                                "strengthUnit": newMed?.strengthUnit ?? "",
//                                "Image": newMed?.Image ?? "",
//                                "taken": newMed?.taken ?? 0,
//                                "toBeTaken": newMed?.toBeTaken ?? 0,
//                                "nextDostTime": newMed?.nextDoseTime.timeIntervalSince1970 ?? 0, // Convert to timestamp (default 0)
//                                "dosageType": newMed?.dosageType ?? "",
//                                "dosage": newMed?.dosage ?? 0,
//                                "quantity": newMed?.quantity ?? 0,
//                                "expiryDate": newMed?.expiryDate.timeIntervalSince1970 ?? 0, // Convert to timestamp (default 0)
//                                "startDate": newMed?.startDate.timeIntervalSince1970 ?? 0, // Convert to timestamp (default 0)
//                                "remindForReorder": newMed?.remindForReorder ?? false,
//                                "breakfast": newMed?.breakfast ?? false,
//                                "lunch": newMed?.lunch ?? false,
//                                "dinner": newMed?.dinner ?? false,
//                                "pillImage": newMed?.pillImage ?? ""
//                            ]
//                        ]
//                    }
                    
                    // Write updated data to Firestore
                    docRef.setData(data) { error in
                        if let error = error {
                            print("Error updating data in Firestore:", error.localizedDescription)
                        } else {
                            print("Medicine data uploaded successfully!")
                            let a = FirestoreManager()
                             
                            a.self.fetchMedicines()
                        }
                    }
                }
            }
        }
                
    }

