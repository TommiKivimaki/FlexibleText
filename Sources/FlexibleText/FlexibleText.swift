import SwiftUI

@available(iOS 15, *)
public struct FlexibleText<Content>: View where Content: View {

    let text: String
    var minLines: Int = 5
    let maxLines: Int = Int.max
    var collapsedTitle: String = "More"
    var expandedTitle: String = "Less"
    var buttonColor: Color = .blue
    var spacing: CGFloat = 8
    let viewMask: Content

    private var buttonTitle: String {
        isExpanded ? expandedTitle : collapsedTitle
    }

    @State private var lineLimit: Int

    @State private var isExpanded = false {
        didSet {
            withAnimation {
                if isExpanded == true {
                    self.lineLimit = self.maxLines
                } else {
                    self.lineLimit = self.minLines
                }
            }
        }
    }

    public init(_ text: String,
                minLines: Int = 3,
                collapsedTitle: String = "More",
                expandedTitle: String = "Less",
                buttonColor: Color = Color.blue,
                spacing: CGFloat = 8,
                @ViewBuilder viewMask: () -> Content) {
        self.text = text
        self.minLines = minLines
        self.collapsedTitle = collapsedTitle
        self.expandedTitle = expandedTitle
        self.buttonColor = buttonColor
        self.spacing = spacing
        self.viewMask = viewMask()
        _lineLimit = State<Int>(initialValue: minLines)
    }

    public var body: some View {
        ZStack {
            VStack(spacing: spacing) {
                Text(text)
                    .lineLimit(lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .mask {
                        if !isExpanded {
                            self.viewMask
                        } else {
                            Color.primary
                        }
                    }

                Button {
                    isExpanded.toggle()
                } label: {
                    Text(buttonTitle)
                        .foregroundColor(buttonColor)
                }
            }
        }
    }
}

@available(iOS 15, *)
struct FlexibleText_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleText("This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text. This is a preview text.") {
            FlexibleTextDefaultMask(color: .primary)
        }
    }
}
