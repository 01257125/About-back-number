import SwiftUI
import MapKit

struct HometownMapView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.9500, longitude: 139.5000),
            span: MKCoordinateSpan(latitudeDelta: 1.8, longitudeDelta: 1.8)
        )
    )

    @State private var selectedLocation: BandLocation? = BackNumberData.locations.first
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Section Header
            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 18))
                
                Text("音樂足跡與聖地巡禮")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
            }

            // Map View
            Map(position: $position) {
                ForEach(BackNumberData.locations) { loc in
                    Annotation(loc.name, coordinate: loc.coordinate) {
                        Button(action: {
                            withAnimation {
                                selectedLocation = loc
                                position = .region(
                                    MKCoordinateRegion(
                                        center: loc.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                                    )
                                )
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(selectedLocation?.id == loc.id ? Color.orange : Color.red)
                                    .frame(width: 36, height: 36)
                                    .shadow(radius: 4)

                                Image(systemName: loc.icon)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.orange.opacity(0.3), lineWidth: 1)
            )

            // Location Selector Pill Carousel
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(BackNumberData.locations) { loc in
                        Button(action: {
                            withAnimation {
                                selectedLocation = loc
                                position = .region(
                                    MKCoordinateRegion(
                                        center: loc.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                                    )
                                )
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: loc.icon)
                                Text(loc.japaneseName)
                            }
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 7)
                            .background(selectedLocation?.id == loc.id ? Color.orange : (colorScheme == .dark ? Color(white: 0.2) : Color.gray.opacity(0.15)))
                            .foregroundColor(selectedLocation?.id == loc.id ? .white : .primary)
                            .clipShape(Capsule())
                        }
                    }
                }
            }

            // Selected Location Detail Card
            if let loc = selectedLocation {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: loc.icon)
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                        .padding(10)
                        .background(Color.orange.opacity(0.15))
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(loc.japaneseName)
                                .font(.system(size: 16, weight: .bold))
                            
                            Spacer()

                            Text(loc.category)
                                .font(.system(size: 11, weight: .bold))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.orange.opacity(0.15))
                                .foregroundColor(.orange)
                                .clipShape(Capsule())
                        }

                        Text(loc.description)
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                            .lineSpacing(3)
                    }
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(colorScheme == .dark ? Color(white: 0.16) : Color.white)
                        .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.06), radius: 6, x: 0, y: 3)
                )
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
    }
}
