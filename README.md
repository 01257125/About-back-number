# back number — 日本國民浪漫情歌天團 About App 🎸

以日本國民浪漫情歌天團 **back number** 為主題打造的精美 iOS 介紹 App。全頁面採用 SwiftUI 宣告式語法設計，完美適應深淺色主題、整合 MapKit 互動地圖、演唱會票券自訂造型、外部字型與串流外鏈跳轉。

## 📱 App 成果展示 (Demo)

> *（提示：可直接將剛剛生成的 `back_number_demo.gif` 拖曳到此處上傳）*

[back_number_demo.gif]

## ✨ 核心特色與功能亮點

* **🎸 搖滾主視覺海報（`BandHeaderView`）**：沉浸式全螢幕穿透海報，套用 Google Fonts 的 **Bebas Neue** 客製字型標題，並內建一鍵切換「明亮 / 深色」模式開關。
* **📖 樂團經歷與自嘲由來（`bandOverviewSection`）**：細膩排版樂團成軍故事，特別標註團名「back number」源自主唱自嘲「被前女友視為過期舊雜誌」的催淚起源。
* **👥 團員互動卡片（`MemberCardView`）**：三位團員（清水依與吏、小島和也、栗原壽）獨立卡片，點擊可動態展開閱讀個人經歷、樂器專長與經典座右銘。
* **💿 歷年代表專輯輪播（`AlbumCardView`）**：水平捲軸展示《ユーモア》、《シャンデリア》與 2026 日產體育場巡迴專輯，點擊直通 Spotify 線上收聽。
* **🔥 必聽神曲 Top 5 排行榜（`SongRowView`）**：
  * 排行榜冠亞軍專屬金銀色圓形徽章。
  * 點擊愛心即時收藏歌曲，並連動頂部「已收藏 X 首」計數。
  * 提供「▶ 觀賞 MV」與「Spotify」雙平台跳轉按鈕。
* **🗺️ 音樂足跡與聖地巡禮（`HometownMapView`）**：整合 Apple MapKit 地圖，標記樂團發祥地（群馬縣太田市）與殿堂聖地（日本武道館），點選下方膠囊標籤時相機鏡頭會平滑導航至對應座標。
* **🔗 官方社群與線上串流（`officialLinksSection`）**：匯整 Spotify、YouTube、官方網站與維基百科，利用 Text Markdown 語法實現輕量化超連結。

## 🛠️ 作業技術要求與達成清單

### 1. 必要基本要求（100% 達成 ✅）
| 規定項目 | 實作成效與程式碼位置 |
| :--- | :--- |
| **指定 UI 元件** | 大量運用 `VStack`, `HStack`, `ZStack`, `Text`, `Image`, `ScrollView` 構建所有頁面 |
| **圖片素材來源** | `SmartImageView` 整合 Assets 本機圖庫；搭配超過 10 款 `SF Symbol` 系統圖示 |
| **多樣化 Modifiers** | 組合使用 `.font()`, `.padding()`, `.background()`, `.clipShape()`, `.shadow()`, `.lineLimit()`, `.lineSpacing()`, `.edgesIgnoringSafeArea()` 等修飾符 |
| **全畫面上下捲動** | `ContentView` 最外層使用垂直 `ScrollView(.vertical, showsIndicators: false)` |
| **多檔案 View 型別** | 拆分為 8 個獨立 View 檔案，符合單一職責與模組化開發架構 |
| **Property 客製化 View** | `AlbumCardView(album:)`、`MemberCardView(...)`、`SongRowView(...)` 等均透過傳入屬性達成元件高度複用 |

### 2. 加分功能全數達成（滿分規格 🏆）
| 加分功能 | 實作說明 |
| :--- | :--- |
| 🌓 **一般與 Dark Mode 切換** | 頂部設有一鍵切換按鈕，全 App 底色、卡片、陰影與文字均支援深淺色動態自適應 |
| 🔗 **Text 搭配 Markdown 連結** | 官方頻道區塊使用 `Text("官方網站：[backnumber.info](https://...)")` 原生語法實現點擊跳轉 |
| 🗺️ **Apple MapKit 互動地圖** | 使用 `Map(position: $position)` 與 `Annotation`，並支援點擊地點平滑動畫移動鏡頭視角 |
| 🎟️ **自訂形狀裁切 (Custom Shape)** | 於 `CustomShapes.swift` 實作 `TicketCardShape`，為歌曲卡片兩側手繪出演唱會門票缺角造型 |
| 🔤 **外部客製字型 (Custom Font)** | 引入 Google Fonts `BebasNeue-Regular.ttf`，主標題套用 `.font(.custom("BebasNeue-Regular", size: 34))` |

## 📂 檔案目錄架構
