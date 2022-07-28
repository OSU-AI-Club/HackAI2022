//
//  CameraView.swift
//  DermAI
//
//  Created by Mihir Joshi and Alvin Ishwime on 4/9/22.
//



import SwiftUI

struct CameraView: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var imagePicked: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    

    var body: some View {
        NavigationView {
            
            VStack {
                
                Image(uiImage: image ?? UIImage(named: "defaultimage")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                
                Button("Upload Picture") {
                    self.showSheet = true
                    
                }
                .padding()
                .actionSheet(isPresented: $showSheet)  {
                    ActionSheet(title: Text("Select an option"),
                                buttons: [
                                    .default(Text("Photo Library")) {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                        imagePicked = true
                                        
                                    },
                                    .default(Text("Camera")) {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                        
                                        
                                    },
                                    .cancel()
                                    
                                ])
                    
                }
                Spacer()
                
                
                if ((image?.isEqual(UIImage(named: "defaultimage"))) != nil)  {
                    NavigationLink {
                        
                        Results(predictedValues: analyze(image: (image  ?? UIImage(named: "defaultimage"))!))
                    } label: {
                        Text("Analyze")
                    }


                }
                
                // TODO - include in another page
                //sends analyze button to another page
//                if image != nil {
//                    NavigationLink(destination: Basal_Cell_Carcinoma()) {
//
//                        Text("Analyze")
//                            .padding(15)
//
//                    }
//                    .background(Color.green)
//                    .cornerRadius(12)
//
//                    Spacer()
//
//                }
                
            }
            
            .navigationBarTitle("Take Skin Photo", displayMode: .inline)
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            
            
        }
    }
}

// MARK: Convert UIImage to CVPixelBuffer
// This is necessary for feeding the image in as an input in the model

func buffer(from image: UIImage) -> CVPixelBuffer? {
  let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
  var pixelBuffer : CVPixelBuffer?
  let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
  guard (status == kCVReturnSuccess) else {
    return nil
  }

  CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
  let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

  let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
  let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

  context?.translateBy(x: 0, y: image.size.height)
  context?.scaleBy(x: 1.0, y: -1.0)

  UIGraphicsPushContext(context!)
  image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
  UIGraphicsPopContext()
  CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

  return pixelBuffer
}


// MARK: Analyze Image
// Use the trained model to give prediction values
func analyze(image: UIImage) -> [String : Double] {
    
    // Initialize Model
    let model = dermAI_model1()
    
    // Resize image
    
    //let image = cancerImage! // your image
    let targetSize = CGSize(width: 28, height: 28)

    // Compute the scaling ratio for the width and height separately
    let widthScaleRatio = targetSize.width / image.size.width
    let heightScaleRatio = targetSize.height / image.size.height

    // To keep the aspect ratio, scale by the smaller scaling ratio
    let scaleFactor = min(widthScaleRatio, heightScaleRatio)

    // Multiply the original image’s dimensions by the scale factor
    // to determine the scaled image size that preserves aspect ratio
    let scaledImageSize = CGSize(
        width: image.size.width * scaleFactor,
        height: image.size.height * scaleFactor
    )
    
    let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
    
    let scaledImage = renderer.image { _ in
        image.draw(in: CGRect(origin: .zero, size: scaledImageSize))
    }
   
    
    print(scaledImage.size.height)
    print(scaledImage.size.width)
    let classification = try! model.prediction(conv2d_input: buffer(from: scaledImage)!)
    
    print(classification.Identity)
    
    return classification.Identity
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
