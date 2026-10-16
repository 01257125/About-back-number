import SwiftUI

struct MemberCardView: View {
    let member: BandMember
    let isSelected: Bool
    let onSelect: () -> Void
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 14) {
                // Member Portrait with SmartImageView & Fallback
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange, Color.red],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 68, height: 68)

                    SmartImageView(
                        imageName: member.imageName,
                        fallbackIcon: member.iconName,
                        title: member.nameKanji
                    )
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                }

                // Basic Member Details Stack
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(member.nameKanji)
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .lineLimit(1)

                        Spacer(minLength: 4)

                        Image(systemName: member.iconName)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.orange)
                    }

                    Text(member.name)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)

                    HStack(spacing: 6) {
                        Text(member.role)
                            .font(.system(size: 10, weight: .bold))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Color.orange.opacity(0.15))
                            .foregroundColor(.orange)
                            .clipShape(Capsule())

                        HStack(spacing: 3) {
                            Image(systemName: "mappin")
                                .font(.system(size: 9))
                            Text(member.birthplace)
                                .font(.system(size: 10))
                        }
                        .foregroundColor(.secondary)
                    }
                }
            }

            // Expanded Bio View
            if isSelected {
                VStack(alignment: .leading, spacing: 10) {
                    Divider()
                        .padding(.vertical, 2)

                    HStack(spacing: 6) {
                        Image(systemName: "guitars")
                            .foregroundColor(.orange)
                            .font(.system(size: 12))
                        Text("樂器專長：")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.secondary)
                        Text(member.instrument)
                            .font(.system(size: 11))
                            .foregroundColor(.primary)
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "calendar")
                            .foregroundColor(.orange)
                            .font(.system(size: 12))
                        Text("生日：")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.secondary)
                        Text(member.birthDate)
                            .font(.system(size: 11))
                            .foregroundColor(.primary)
                    }

                    Text(member.bio)
                        .font(.system(size: 12))
                        .lineSpacing(4)
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(colorScheme == .dark ? Color.white.opacity(0.06) : Color.black.opacity(0.04))
                        )

                    Text(member.favoriteQuote)
                        .font(.system(size: 11, weight: .medium, design: .serif))
                        .italic()
                        .foregroundColor(.orange)
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(colorScheme == .dark ? Color(white: 0.16) : Color.white)
                .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.08), radius: 6, x: 0, y: 3)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color.orange.opacity(0.6) : Color.clear, lineWidth: 1.5)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                onSelect()
            }
        }
    }
}
