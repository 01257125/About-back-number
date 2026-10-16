import SwiftUI

struct ContentView: View {
    // State management
    @State private var isDarkMode: Bool = true
    @State private var selectedMemberId: UUID? = BackNumberData.members.first?.id
    @State private var likedSongIds: Set<UUID> = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                // 1. Hero Band Header View
                BandHeaderView(isDarkMode: $isDarkMode)
                
                VStack(spacing: 20) {
                    // 2. Band Overview Section
                    bandOverviewSection
                    
                    // 3. Band Members Section
                    membersSection
                    
                    // 4. Discography Section (Albums & Spotify links)
                    discographySection
                    
                    // 5. Popular Hit Songs Section (Songs & YouTube MV links)
                    hitSongsSection
                    
                    // 6. Hometown Map Section (MapKit integration with Markers)
                    HometownMapView()
                    
                    // 7. Music Streaming & Official Links Section (Markdown Links + Direct Links)
                    officialLinksSection
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
        }
        .edgesIgnoringSafeArea(.top)
        .background(isDarkMode ? Color(white: 0.1) : Color(red: 0.96, green: 0.96, blue: 0.98))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    // MARK: - Subviews & Sections
    
    /// Band Overview Section
    private var bandOverviewSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: "sparkles")
                    .foregroundColor(.orange)
                    .font(.system(size: 16))
                
                Text("樂團簡介")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("back number 是 2004 年成立於日本群馬縣的 3 人組搖滾樂團。主唱清水依與吏細膩捕捉戀愛中無奈、酸甜與執著的歌詞，搭配雋永抓耳的旋律，讓樂團自 2011 年 mainstream 初出道以來，迅速紅遍全日本。")
                    .font(.system(size: 13))
                    .lineSpacing(4)
                    .foregroundColor(.primary)
                
                Text("團名「back number」源自主唱清水依與吏前女友交了新男友時的自嘲——「在她眼中，我已經是過期的舊雜誌（Back Number）了」。這份真摯自嘲的精神，成為樂團寫下無數感動人心金曲的起點。")
                    .font(.system(size: 12, weight: .medium))
                    .lineSpacing(4)
                    .foregroundColor(.secondary)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isDarkMode ? Color.white.opacity(0.06) : Color.orange.opacity(0.08))
                    )
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isDarkMode ? Color(white: 0.16) : Color.white)
                    .shadow(color: Color.black.opacity(isDarkMode ? 0.3 : 0.06), radius: 5, x: 0, y: 2)
            )
        }
    }
    
    /// Band Members Section
    private var membersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "person.3.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 16))
                
                Text("團員介紹")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("點擊卡片展開細節")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 12) {
                ForEach(BackNumberData.members) { member in
                    MemberCardView(
                        member: member,
                        isSelected: selectedMemberId == member.id,
                        onSelect: {
                            if selectedMemberId == member.id {
                                selectedMemberId = nil
                            } else {
                                selectedMemberId = member.id
                            }
                        }
                    )
                }
            }
        }
    }
    
    /// Discography Section
    private var discographySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "opticaldisc")
                    .foregroundColor(.orange)
                    .font(.system(size: 16))
                
                Text("代表專輯 & 精選輯")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(BackNumberData.albums) { album in
                        AlbumCardView(album: album)
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }
    
    /// Popular Hit Songs Section with MV Links
    private var hitSongsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "guitars.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 16))
                
                Text("必聽神曲 Top 5")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                if !likedSongIds.isEmpty {
                    Text("已收藏 \(likedSongIds.count) 首")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.red.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
            
            VStack(spacing: 10) {
                ForEach(Array(BackNumberData.hitSongs.enumerated()), id: \.element.id) { index, song in
                    SongRowView(
                        index: index + 1,
                        song: song,
                        isLiked: likedSongIds.contains(song.id),
                        onToggleLike: {
                            if likedSongIds.contains(song.id) {
                                likedSongIds.remove(song.id)
                            } else {
                                likedSongIds.insert(song.id)
                            }
                        }
                    )
                }
            }
        }
    }
    
    /// Music Streaming Platforms & Official Links Section
    private var officialLinksSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(.orange)
                    .font(.system(size: 16))
                
                Text("線上收聽與官方頻道")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                // Spotify Link
                Link(destination: URL(string: "https://open.spotify.com/artist/6rs1KAoQnFalSqSU4LTh8g?")!) {
                    HStack {
                        Image(systemName: "music.note.house.fill")
                            .foregroundColor(.green)
                        Text("Spotify 官方歌手頁面")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }
                    .padding(10)
                    .background(Color.green.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                // YouTube Channel Link (Text with Markdown syntax)
                HStack(spacing: 8) {
                    Image(systemName: "play.tv.fill")
                        .foregroundColor(.red)
                    Text("YouTube 頻道：[back number YouTube](https://www.youtube.com/c/backnumberchannel)")
                        .font(.system(size: 13))
                }
                .padding(.top, 4)
                
                Divider()
                
                // Official Website Link (Markdown syntax)
                HStack(spacing: 8) {
                    Image(systemName: "globe")
                        .foregroundColor(.orange)
                    Text("官方網站：[backnumber.info](https://backnumber.info)")
                        .font(.system(size: 13))
                }
                
                Divider()
                
                // Wikipedia Link (Markdown syntax)
                HStack(spacing: 8) {
                    Image(systemName: "book.fill")
                        .foregroundColor(.blue)
                    Text("維基百科：[back number Wikipedia](https://zh.wikipedia.org/zh-tw/Back_number)")
                        .font(.system(size: 13))
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isDarkMode ? Color(white: 0.16) : Color.white)
                    .shadow(color: Color.black.opacity(isDarkMode ? 0.3 : 0.06), radius: 5, x: 0, y: 2)
            )
            
            // Footer Note
            Text("Created for iOS App Dev Homework #211 • back number About App")
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 8)
        }
    }
}

#Preview {
    ContentView()
}
