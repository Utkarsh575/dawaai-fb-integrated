//import SwiftUI
//import FirebaseStorage
//
//struct FileUploader: View {
//  @State private var showingImagePicker = false
//  @State private var selectedImage: UIImage?
//  @State private var imageUrl: String?
//  @State private var showAlert = false
//  @State private var alertMessage = ""
//
//  func uploadImageToStorage() {
//    guard let image = selectedImage, let imageData = image.jpegData(compressionQuality: 0.75) else {
//      showAlert(message: "Please select an image")
//      return
//    }
//
//    let storageRef = Storage.storage().reference()
//    let imageRef = storageRef.child("images/\(UUID().uuidString).jpg") // Generate unique filename
//
//    imageRef.putData(imageData, metadata: nil) { metadata, error in
//      if let error = error {
//        showAlert(message: "Error uploading image: \(error.localizedDescription)")
//        return
//      }
//
//      imageRef.downloadURL { url, error in
//        if let error = error {
//          showAlert(message: "Error getting image URL: \(error.localizedDescription)")
//          return
//        }
//
//        guard let imageUrl = url?.absoluteString else {
//          showAlert(message: "Failed to retrieve image URL")
//          return
//        }
//
//        self.imageUrl = imageUrl
//        print("Image uploaded successfully! URL:", imageUrl)
//      }
//    }
//  }
//
//  func showAlert(message: String) {
//    alertMessage = message
//    showAlert = true
//  }
//
//  var body: some View {
//    VStack {
//      if let imageUrl = imageUrl, let imageURL = URL(string: imageUrl) {
//        Image(url: imageURL)
//          .resizable()
//          .aspectRatio(contentMode: .fit)
//          .frame(width: 200, height: 200)
//      } else {
//        Button("Select Image") {
//          showingImagePicker = true
//        }
//      }
//
//      Button("Upload Image") {
//        uploadImageToStorage()
//      }
//      .disabled(selectedImage == nil)
//      .foregroundColor(selectedImage == nil ? .gray : .blue)
//    }
//    .sheet(isPresented: $showingImagePicker) {
//      ImagePicker(image: $selectedImage)
//    }
//    .alert(isPresented: $showAlert) {
//      Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//    }
//  }
//}
//
//struct ImagePicker1: UIViewControllerRepresentable {
//  @Binding var image: UIImage?
//
//  func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//  }
//
//  func makeUIViewController(context: Context) -> UIImagePickerController {
//    let picker = UIImagePickerController()
//    picker.delegate = context.coordinator
//    picker.sourceType = .photoLibrary
//    return picker
//  }
//
//  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    let parent: ImagePicker
//
//    init(_ parent: ImagePicker) {
//      self.parent = parent
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//      if let image = info[.originalImage] as? UIImage {
//        parent.image = image
//      }
//      picker.dismiss(animated: true)
//    }
//  }
//}
