import SwiftUI

struct AlbumCardView: View {
    let album: Album
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                SmartImageView(
                    imageName: album.imageName,
                    fallbackIcon: "opticaldisc.fill",
                    title: album.titleKanji
                )
                
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
                Text(album.releaseYear)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(5)
            }
            
            // Album Title & Subtitle
            VStack(alignment: .leading, spacing: 3) {
                Text(album.titleKanji)
                    .font(.system(size: 14, weight: .bold))
                    .lineLimit(1)
                    .foregroundColor(.primary)
                
                Text(album.type)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.orange)
                
                Text(album.description)
                    .font(.system(size: 10))
                    .lineLimit(2)
                    .foregroundColor(.secondary)
                    .lineSpacing(2)
            }

            // Top Tracks Carousel Pills
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(album.topTracks, id: \.self) { track in
                        HStack(spacing: 2) {
                            Image(systemName: "music.note")
                                .font(.system(size: 8))
                            Text(track)
                                .font(.system(size: 9, weight: .medium))
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Color.orange.opacity(0.12))
                        .foregroundColor(.orange)
                        .clipShape(Capsule())
                    }
                }
            }

            // Spotify / Music Streaming Link Button
            if let url = URL(string: album.spotifyUrl) {
                Link(destination: url) {
                    HStack(spacing: 4) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 11))
                        Text("Spotify 專輯收聽")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.15))
                    .foregroundColor(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
        }
        .padding(10)
        .frame(width: 160)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(colorScheme == .dark ? Color(white: 0.16) : Color.white)
                .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.06), radius: 4, x: 0, y: 2)
        )
    }
}
