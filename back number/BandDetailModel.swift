import SwiftUI
import CoreLocation

// MARK: - Band Member Model
struct BandMember: Identifiable {
    let id = UUID()
    let name: String
    let nameKanji: String
    let role: String
    let instrument: String
    let birthDate: String
    let birthplace: String
    let imageName: String
    let bio: String
    let favoriteQuote: String
    let iconName: String
}

// MARK: - Album Model
struct Album: Identifiable {
    let id = UUID()
    let title: String
    let titleKanji: String
    let releaseYear: String
    let type: String
    let imageName: String
    let description: String
    let topTracks: [String]
    let spotifyUrl: String
}

// MARK: - Hit Song Model
struct HitSong: Identifiable {
    let id = UUID()
    let title: String
    let japaneseTitle: String
    let releaseYear: String
    let tieIn: String
    let description: String
    let playCount: String
    let youtubeUrl: String
    let spotifyUrl: String
}

// MARK: - Band Location Model
struct BandLocation: Identifiable {
    let id = UUID()
    let name: String
    let japaneseName: String
    let category: String
    let description: String
    let latitude: Double
    let longitude: Double
    let icon: String
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

// MARK: - Sample Data
struct BackNumberData {
    static let members: [BandMember] = [
        BandMember(
            name: "Iyori Shimizu",
            nameKanji: "清水 依與吏",
            role: "Vocal & Guitar",
            instrument: "Acoustic / Electric Guitar, Vocals",
            birthDate: "1984.07.09",
            birthplace: "群馬縣太田市",
            imageName: "shimizu_iyori",
            bio: "back number 的團長兼主唱與吉他手，負責樂團幾乎所有的詞曲創作。出道前曾擔任鈑金維修技師。其創作的歌詞以極具同理心、細膩真實的『單戀』與『失戀』情感描寫著稱，被日本青年世代稱為『戀愛心聲代言人』。",
            favoriteQuote: "「想要創做出能陪伴大家悲傷與幸福每一刻的歌曲。」",
            iconName: "guitars.fill"
        ),
        BandMember(
            name: "Kazuya Kohojima",
            nameKanji: "小島 和也",
            role: "Bass & Chorus",
            instrument: "Bass Guitar, Chorus",
            birthDate: "1984.05.16",
            birthplace: "群馬縣伊勢崎市",
            imageName: "kohojima_kazuya",
            bio: "貝斯手兼和聲。與清水依與吏同歲，自高中時期便一起打著樂團。以穩健而飽滿的 Bass Line 為樂團提供強大的旋律支撐，舞台上沈穩內斂的態度深受歌迷喜愛。",
            favoriteQuote: "「用最紮實的低音，給予旋律最溫暖的依靠。」",
            iconName: "music.note"
        ),
        BandMember(
            name: "Hisashi Kurihara",
            nameKanji: "栗原 寿",
            role: "Drums",
            instrument: "Drums & Percussion",
            birthDate: "1985.07.24",
            birthplace: "群馬縣伊勢崎市",
            imageName: "kurihara_hisashi",
            bio: "鼓手。團體中最年輕的成員，曾擔任過護理師。充滿爆發力與節奏感的鼓技，是 back number 現場演唱會能量爆發的引擎。總是帶著溫暖的笑臉，是樂團的開心果。",
            favoriteQuote: "「只要鼓聲響起，現場的每顆心都能合拍連結！」",
            iconName: "bolt.heart.fill"
        )
    ]
    
    static let albums: [Album] = [
        Album(
            title: "HUMOR",
            titleKanji: "ユーモア",
            releaseYear: "2023",
            type: "7th Full Album",
            imageName: "album_humor",
            description: "睽違四年的第七張原創大碟，收錄《水平線》、《アイラブユー》、《黄色》等多首數位大熱單曲，完美詮釋後疫情時代的人情溫暖。",
            topTracks: ["水平線", "アイラブユー", "怪盗", "黄色", "ベルベットの詩"],
            spotifyUrl: "https://open.spotify.com/album/4Owee1i5rIFJvQczZXSdiQ"
        ),
        Album(
            title: "Chandelier",
            titleKanji: "シャンデリア",
            releaseYear: "2015",
            type: "5th Full Album",
            imageName: "album_chandelier",
            description: "創下百萬銷量紀錄的殿堂級專輯！收錄日劇神曲《Christmas Song》與《Suiheisen》前身情歌，奠定日本國民情歌天團地位。",
            topTracks: ["クリスマスソング", "ヒロイン", "SISTER", "手紙", "サイレン"],
            spotifyUrl: "https://open.spotify.com/album/6TrqbAJxtGl4HWK5SUbFLT"
        ),
        Album(
            title: "Grateful Yesterdays Tour 2026",
            titleKanji: "Grateful Yesterdays 2026",
            releaseYear: "2026",
            type: "Live Album",
            imageName: "album_tour2026",
            description: "2026年日產體育場（NISSAN STADIUM）演唱會現場音源，收錄《幕が上がる》、《大不正解》等 20 首震撼全場的超嗨 Live！",
            topTracks: ["幕が上がる", "スーパースターになったら", "クリスマスソング", "青い春", "SISTER", "大不正解", "花束"],
            spotifyUrl: "https://open.spotify.com/album/7xLMVpgfwwxTPmAOPXwexb"
        )
    ]
    
    static let hitSongs: [HitSong] = [
        HitSong(
            title: "Horizontal Line",
            japaneseTitle: "水平線 (Suiheisen)",
            releaseYear: "2020",
            tieIn: "令和2年度 全國高中體育大會 (Inter-High) 應援曲",
            description: "因疫情取消的全國高中聯賽而特地創作的安慰之歌，YouTube 播放次數突破 2.3 億次，成為感動全日本的勵志國民曲。",
            playCount: "2.3 億+ 播放",
            youtubeUrl: "https://youtu.be/iqEr3P78fz8",
            spotifyUrl: "https://open.spotify.com/track/5m1i6hq7dmRlp3c1utE48L"
        ),
        HitSong(
            title: "Christmas Song",
            japaneseTitle: "クリスマスソング",
            releaseYear: "2015",
            tieIn: "日劇《朝5晚9》主題曲",
            description: "石原聰美與山下智久主演日劇主題曲，每逢聖誕季節必登場的冬季戀歌經典標籤。",
            playCount: "1.8 億+ 播放",
            youtubeUrl: "https://youtu.be/7zBeQezaz4U",
            spotifyUrl: "https://open.spotify.com/track/5P8ZvBQoCrujjNcLAxO3Su?"
        ),
        HitSong(
            title: "Happy End",
            japaneseTitle: "ハッピーエンド",
            releaseYear: "2016",
            tieIn: "電影《明日的我與昨天的妳約會》主題曲",
            description: "描寫強忍淚水道別的女孩心境，被評選為「聽到第一句歌詞就會飆淚」的失戀名曲。",
            playCount: "1.5 億+ 播放",
            youtubeUrl: "https://youtu.be/T8y_RsF4TSw",
            spotifyUrl: "https://open.spotify.com/track/4GqO80eGXA542oTvlYv4LS"
        ),
        HitSong(
            title: "Takane no Hanako-san",
            japaneseTitle: "高嶺の花子さん",
            releaseYear: "2013",
            tieIn: "飲品宣傳曲 / 樂團最具代表性夏日單曲",
            description: "輕快奔放的節奏搭配內向男生的幻想情節，KTV 點播排行榜常勝軍。",
            playCount: "1.2 億+ 播放",
            youtubeUrl: "https://youtu.be/SII-S-zCg-c",
            spotifyUrl: "https://open.spotify.com/track/2jdbZGFp8KVTuk0YxDNL4l"
        ),
        HitSong(
            title: "I Love You",
            japaneseTitle: "アイラブユー",
            releaseYear: "2022",
            tieIn: "NHK 晨間劇《飛舞吧！》主題曲",
            description: "細膩溫暖的旋律與歌詞，溫柔包容每日清晨的生活喜樂。",
            playCount: "5,500 萬+ 播放",
            youtubeUrl: "https://youtu.be/_k0mJYct4UE?si=ZH5m_mvPJhTF6xdS",
            spotifyUrl: "https://open.spotify.com/track/4gbHag1jhjLTDcrbfpFnYQ"
        )
    ]
    
    static let locations: [BandLocation] = [
        BandLocation(
            name: "Gunma Ota City",
            japaneseName: "群馬縣太田市",
            category: "樂團發祥地",
            description: "清水依與吏的故鄉與 back number 組成的起點，無數名曲靈感的搖籃。",
            latitude: 36.2941,
            longitude: 139.3725,
            icon: "house.fill"
        ),
        BandLocation(
            name: "Nippon Budokan",
            japaneseName: "日本武道館",
            category: "聖地 Live 殿堂",
            description: "2013 年 back number 首次登上武道館舉辦專場，標誌著進入一線樂團殿堂。",
            latitude: 35.6933,
            longitude: 139.7497,
            icon: "star.circle.fill"
        ),
        BandLocation(
            name: "Tokyo Dome",
            japaneseName: "東京巨蛋",
            category: "Dome Tour 巨蛋巡迴",
            description: "成功舉行三大巨蛋與五大巨蛋巡迴演唱會，萬人齊唱感動落淚。",
            latitude: 35.7056,
            longitude: 139.7519,
            icon: "music.mic.circle.fill"
        )
    ]
}
