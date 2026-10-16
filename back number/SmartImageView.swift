import SwiftUI

// MARK: - Smart Image View with Sleek Placeholder
struct SmartImageView: View {
    let imageName: String
    let fallbackIcon: String
    let title: String
    var aspectRatio: ContentMode = .fill

    init(imageName: String, fallbackIcon: String, title: String = "", aspectRatio: ContentMode = .fill) {
        self.imageName = imageName
        self.fallbackIcon = fallbackIcon
        self.title = title
        self.aspectRatio = aspectRatio
    }

    var body: some View {
        if let uiImage = UIImage(named: imageName), uiImage.size.width > 0 {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: aspectRatio)
        } else {
            // Sleek Gradient Placeholder
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.12, green: 0.1, blue: 0.18),
                        Color(red: 0.85, green: 0.38, blue: 0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                VStack(spacing: 6) {
                    Image(systemName: fallbackIcon)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white.opacity(0.9))
                    
                    if !title.isEmpty {
                        Text(title)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.white.opacity(0.85))
                    } else {
                        Text("放入原圖")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(8)
            }
        }
    }
}
