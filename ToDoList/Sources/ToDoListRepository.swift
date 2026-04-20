import Foundation

protocol ToDoListRepositoryType {
    func loadToDoItems() -> [ToDoItem]
    func saveToDoItems(_ toDoItems: [ToDoItem])
}

final class ToDoListRepository: ToDoListRepositoryType {
    private let fileURL: URL

    init() {
        // Define a file URL for storing the to-do items in a JSON file
        if let documentsDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first {
            fileURL = documentsDirectory.appendingPathComponent("ToDoItems.json")
        } else {
            fatalError("Failed to get documents directory.")
        }
    }

    // Load to-do items from the JSON file
    func loadToDoItems() -> [ToDoItem] {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let toDoItems = try decoder.decode([ToDoItem].self, from: data)
            return toDoItems
        } catch {
            print("Error loading to-do items: \(error.localizedDescription)")
            return []
        }
    }

    // Save to-do items to the JSON file
    func saveToDoItems(_ toDoItems: [ToDoItem]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(toDoItems)
            try data.write(to: fileURL)
        } catch {
            print("Error saving to-do items: \(error.localizedDescription)")
        }
    }
}
