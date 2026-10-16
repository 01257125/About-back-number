import SwiftUI

struct SongRowView: View {
    let index: Int
    let song: HitSong
    let isLiked: Bool
    let onToggleLike: () -> Void
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                // Rank Badge Number
                ZStack {
                    Circle()
                        .fill(index == 1 ? Color.orange : (index == 2 ? Color.yellow : Color.gray.opacity(0.3)))
                        .frame(width: 28, height: 28)
                    
                    Text("\(index)")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(index <= 2 ? .white : .primary)
                }
                
                // Song Title & Release Year
                VStack(alignment: .leading, spacing: 2) {
                    Text(song.japaneseTitle)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Text(song.tieIn)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.orange)
                        .lineLimit(1)
                }
                
                Spacer()
                
                // Like / Favorite Button
                Button(action: onToggleLike) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                        .font(.system(size: 16))
                        .padding(6)
                        .background(isLiked ? Color.red.opacity(0.12) : Color.gray.opacity(0.1))
                        .clipShape(Circle())
                }
            }
            
            Text(song.description)
                .font(.system(size: 11))
                .foregroundColor(.secondary)
                .lineSpacing(3)

            // Music Play Button & MV Link Row
            HStack(spacing: 8) {
                // Direct YouTube MV Link Button
                if let url = URL(string: song.youtubeUrl) {
                    Link(destination: url) {
                        HStack(spacing: 4) {
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 13))
                            Text("▶ 觀賞 MV")
                                .font(.system(size: 11, weight: .bold))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                }
                if let spotifyUrl = URL(string: song.spotifyUrl) {
                    Link(destination: spotifyUrl) {
                        HStack(spacing: 4) {
                            Image(systemName: "music.note")
                                .font(.system(size: 11))
                            Text("Spotify")
                                .font(.system(size: 11, weight: .bold))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                }
                
                // Play count
                HStack(spacing: 3) {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 9))
                        .foregroundColor(.orange)
                    Text(song.playCount)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
        }
        .padding(12)
        .background(
            TicketCardShape()
                .fill(colorScheme == .dark ? Color(white: 0.16) : Color.white)
                .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.08), radius: 5, x: 0, y: 2)
        )
    }
}
