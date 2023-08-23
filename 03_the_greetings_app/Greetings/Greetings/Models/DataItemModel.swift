import Foundation
import SwiftUI

struct DataItemModel: Identifiable {
    let id = UUID()
    let text: LocalizedStringKey
    let color: Color
}
