import SwiftUI

@available(iOS 15, *)
public struct FlexibleText: View {

    private var text: String
    private var minLines: Int
    private var maxLines: Int
    private var collapsedTitle: String
    private var expandedTitle: String
    private var spacing: CGFloat
    private var colors: (Color, Color)

    private var buttonTitle: String {
        isExpanded ? expandedTitle : collapsedTitle
    }

    @State private var lineLimit: Int

    @State private var isExpanded = false {
        didSet {
            withAnimation {
                if isExpanded == true {
                    self.lineLimit = self.maxLines
                    self.gradient = LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: colors.0, location: 1.0)]),
                                   startPoint: .top, endPoint: .bottom)
                } else {
                    self.lineLimit = self.minLines
                    self.gradient = LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: colors.0, location: 0.5),
                        Gradient.Stop(color: colors.1, location: 0.95)]),
                                   startPoint: .top, endPoint: .bottom)
                }
            }
        }
    }

    @State private var gradient: LinearGradient

    public init(_ text: String,
                minLines: Int = 3,
                maxLines: Int = Int.max,
                collapsedTitle: String = "More",
                expandedTitle: String = "Less",
                spacing: CGFloat = 8,
                gradientColors: (Color, Color) = (.primary, .clear)) {
        self.text = text
        self.minLines = minLines
        self.maxLines = maxLines
        self.lineLimit = minLines
        self.collapsedTitle = collapsedTitle
        self.expandedTitle = expandedTitle
        self.spacing = spacing
        self.colors = gradientColors
        self.gradient = LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: colors.0, location: 0.5),
            Gradient.Stop(color: colors.1, location: 0.95)]),
                       startPoint: .top, endPoint: .bottom)
    }

    public var body: some View {
        VStack(spacing: spacing) {
            Text(text)
                .lineLimit(lineLimit)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(gradient)

            Button(buttonTitle) {
                isExpanded.toggle()
            }
        }
    }
}

@available(iOS 15, *)
struct FlexibleText_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleText("This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text.",
        minLines: 3)
    }
}
