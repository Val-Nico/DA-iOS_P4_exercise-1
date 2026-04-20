@testable import ToDoList
import Foundation

final class MockToDoListRepository: ToDoListRepositoryType {
    var mockToDoItems: [ToDoItem]

    init(initialItems: [ToDoItem] = []) {
        self.mockToDoItems = initialItems
    }

    func loadToDoItems() -> [ToDoItem] {
        return mockToDoItems
    }

    func saveToDoItems(_ items: [ToDoItem]) {
        mockToDoItems = items
    }
}
