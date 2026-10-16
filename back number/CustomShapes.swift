import SwiftUI

// MARK: - Concert Ticket Shape (Custom Clip Shape)
struct TicketCardShape: Shape {
    var cornerRadius: CGFloat = 16
    var notchRadius: CGFloat = 12
    var notchYOffsetRatio: CGFloat = 0.65

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let notchY = h * notchYOffsetRatio

        // Top-left
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        path.addLine(to: CGPoint(x: w - cornerRadius, y: 0))
        path.addArc(center: CGPoint(x: w - cornerRadius, y: cornerRadius),
                    radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        // Right side with notch
        path.addLine(to: CGPoint(x: w, y: notchY - notchRadius))
        path.addArc(center: CGPoint(x: w, y: notchY),
                    radius: notchRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: true)
        path.addLine(to: CGPoint(x: w, y: h - cornerRadius))

        // Bottom-right
        path.addArc(center: CGPoint(x: w - cornerRadius, y: h - cornerRadius),
                    radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        // Bottom side
        path.addLine(to: CGPoint(x: cornerRadius, y: h))

        // Bottom-left
        path.addArc(center: CGPoint(x: cornerRadius, y: h - cornerRadius),
                    radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        // Left side with notch
        path.addLine(to: CGPoint(x: 0, y: notchY + notchRadius))
        path.addArc(center: CGPoint(x: 0, y: notchY),
                    radius: notchRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 270), clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))

        // Top-left corner arc
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

// MARK: - Wave Header Shape
struct WaveHeaderShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: h - 30))

        path.addCurve(
            to: CGPoint(x: 0, y: h - 10),
            control1: CGPoint(x: w * 0.65, y: h + 15),
            control2: CGPoint(x: w * 0.35, y: h - 50)
        )

        path.closeSubpath()
        return path
    }
}

// MARK: - Rounded Hexagon Badge Shape
struct HexagonBadgeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        for i in 0..<6 {
            let angle = CGFloat(i) * .pi / 3 - .pi / 6
            let pt = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            if i == 0 {
                path.move(to: pt)
            } else {
                path.addLine(to: pt)
            }
        }
        path.closeSubpath()
        return path
    }
}
