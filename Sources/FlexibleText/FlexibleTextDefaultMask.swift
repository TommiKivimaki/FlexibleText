// Copyright © 30.6.2022 Tommi Kivimäki.

import SwiftUI

struct FlexibleTextDefaultMask: View {

    let color: Color

    var body: some View {
        LinearGradient(stops: [
            Gradient.Stop(color: color, location: 0.55),
            Gradient.Stop(color: .clear, location: 0.95)],
                       startPoint: .top,
                       endPoint: .bottom)
    }
}

struct FlexibleTextDefaultMask_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleTextDefaultMask(color: .primary)
    }
}
