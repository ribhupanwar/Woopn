import SwiftUI
import StrandDesign

/// WHOOP-inspired pillar identity used by the clean-room screen port.
enum WhoopPillarKind {
    case recovery
    case sleep
    case strain

    var tint: Color {
        switch self {
        case .recovery: WhoopReferencePalette.recoveryHigh
        case .sleep: WhoopReferencePalette.sleep
        case .strain: WhoopReferencePalette.dayStrain
        }
    }

    var track: Color { Color.white.opacity(0.14) }
}

/// A data-honest circular pillar gauge. Nil values render as placeholders rather than sample data.
struct WhoopPillarGauge: View {
    let title: String
    let value: String?
    let progress: Double?
    let kind: WhoopPillarKind
    var diameter: CGFloat = 156
    var footnote: String? = nil

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .stroke(kind.track, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                if let progress, progress.isFinite {
                    Circle()
                        .trim(from: 0, to: min(1, max(0, progress)))
                        .stroke(kind.tint, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                }
                VStack(spacing: 3) {
                    Text(title.uppercased())
                        .font(StrandFont.overline)
                        .tracking(1.1)
                        .foregroundStyle(.white.opacity(0.68))
                    Text(value ?? "--")
                        .font(StrandFont.display(diameter * 0.29))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.65)
                    if let footnote {
                        Text(footnote.uppercased())
                            .font(StrandFont.overlineScaled(9))
                            .tracking(0.8)
                            .foregroundStyle(.white.opacity(0.55))
                    }
                }
                .padding(12)
            }
            .frame(width: diameter, height: diameter)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title), \(value ?? "not available")")
    }
}

/// Compact, aligned metric row for Recovery, Sleep, Health and Activity details.
struct WhoopMetricRow: View {
    let title: String
    let value: String?
    var unit: String? = nil
    var detail: String? = nil
    var symbol: String? = nil

    var body: some View {
        HStack(spacing: 12) {
            if let symbol {
                Image(systemName: symbol)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white.opacity(0.65))
                    .frame(width: 22)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(title.uppercased())
                    .font(StrandFont.overlineScaled(10))
                    .tracking(0.7)
                    .foregroundStyle(.white.opacity(0.62))
                if let detail {
                    Text(detail)
                        .font(StrandFont.footnote)
                        .foregroundStyle(.white.opacity(0.48))
                }
            }
            Spacer(minLength: 8)
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value ?? "--")
                    .font(StrandFont.number(22, weight: .semibold))
                    .foregroundStyle(.white)
                if let unit {
                    Text(unit)
                        .font(StrandFont.caption)
                        .foregroundStyle(.white.opacity(0.62))
                }
            }
        }
        .padding(.vertical, 12)
        .accessibilityElement(children: .combine)
    }
}

/// WHOOP-style section heading with an optional trailing context label.
struct WhoopSectionHeader: View {
    let title: String
    var trailing: String? = nil

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title.uppercased())
                .font(StrandFont.overline)
                .tracking(1.2)
                .foregroundStyle(.white.opacity(0.72))
            Spacer()
            if let trailing {
                Text(trailing.uppercased())
                    .font(StrandFont.overlineScaled(9))
                    .tracking(0.8)
                    .foregroundStyle(.white.opacity(0.42))
            }
        }
    }
}

/// Shared card shell for the clean-room WHOOP screen composition.
struct WhoopReferenceCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(WhoopReferencePalette.greyBlue, in: RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.06), lineWidth: 1)
        }
    }
}
