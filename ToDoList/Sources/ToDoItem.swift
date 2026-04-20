import Foundation

struct ToDoItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}
