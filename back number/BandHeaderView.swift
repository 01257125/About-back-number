import SwiftUI

struct BandHeaderView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Header Image or Stage Gradient
            SmartImageView(
                imageName: "backnumber_band",
                fallbackIcon: "guitars.fill",
                title: "back number 樂團"
            )
            .frame(height: 270)
            .clipped()
            .overlay(
                LinearGradient(
                    colors: [
                        Color.black.opacity(0.3),
                        Color.black.opacity(0.6),
                        Color.black.opacity(0.95)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            // Header Content Stack
            VStack(alignment: .leading, spacing: 10) {
                // Top Action & Category Bar Row
                HStack(spacing: 6) {
                    HStack(spacing: 3) {
                        Image(systemName: "music.quaver.fill")
                            .font(.system(size: 9))
                        Text("J-POP / ROCK")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                    HStack(spacing: 3) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 9))
                        Text("群馬發祥")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.25))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                    Spacer(minLength: 4)
                    
                    // Dark / Light Mode Toggle Button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isDarkMode.toggle()
                        }
                    }) {
                        HStack(spacing: 3) {
                            Image(systemName: isDarkMode ? "sun.max.fill" : "moon.stars.fill")
                                .font(.system(size: 11))
                            Text(isDarkMode ? "明亮" : "暗黑")
                                .font(.system(size: 10, weight: .bold))
                        }
                        .foregroundColor(isDarkMode ? .yellow : .white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.black.opacity(0.5))
                        .clipShape(Capsule())
                    }
                }
                .padding(.top, 48) // Safe margin for status bar
                
                Spacer()
                
                // Band Title Header
                VStack(alignment: .leading, spacing: 2) {
                    Text("back number")
                        .font(.custom("BebasNeue-Regular", size: 34))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)

                    Text("バックナンバー ｜ 日本國民浪漫情歌天團")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
                
                // Quick Band Info Pills
                HStack(spacing: 6) {
                    StatBadgeView(icon: "calendar", title: "正式成立", value: "2004年")
                    StatBadgeView(icon: "star.fill", title: "出道", value: "2011年")
                    StatBadgeView(icon: "person.3.fill", title: "團員", value: "3人")
                    StatBadgeView(icon: "heart.fill", title: "代表作", value: "水平線")
                }
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 12)
            .frame(height: 270)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Stat Badge Helper View
struct StatBadgeView: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 9))
                .foregroundColor(.orange)
            
            Text("\(title): \(value)")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(Color.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
