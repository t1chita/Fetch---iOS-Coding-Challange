import SwiftUI

@MainActor
class ImageLoader: ObservableObject {
    let url: URL?
    
    @Published var image: UIImage? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    init(url: URL?) {
        self.url = url
    }
    
    func fetchImage() async {
        guard image == nil else { return }
        guard let url = url else {
            errorMessage = "Bad URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                errorMessage = "Bad Response"
                print("Bad Response: \(response)")
                return
            }
            
            guard let fetchedImage = UIImage(data: data) else {
                errorMessage = "Failed to decode image"
                return
            }
            
            image = fetchedImage
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
