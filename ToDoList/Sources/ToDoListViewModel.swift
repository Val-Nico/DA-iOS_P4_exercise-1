import SwiftUI

final class ToDoListViewModel: ObservableObject {
    // MARK: - Private properties

    private let repository: ToDoListRepositoryType
    
    /// Stores all items unfiltered, as the source of truth.
    private var allToDoItems: [ToDoItem] = []
    
    /// Tracks the currently active filter index.
    private var currentFilterIndex: Int = 0

    // MARK: - Init

    init(repository: ToDoListRepositoryType) {
        self.repository = repository
        self.allToDoItems = repository.loadToDoItems()
        self.toDoItems = allToDoItems
    }

    // MARK: - Outputs

    /// Publisher for the filtered list of to-do items displayed in the UI.
    @Published var toDoItems: [ToDoItem] = [] {
        didSet {
            repository.saveToDoItems(allToDoItems)
        }
    }

    // MARK: - Inputs

    /// Adds a new to-do item and refreshes the filtered list.
    func add(item: ToDoItem) {
        allToDoItems.append(item)
        applyFilter(at: currentFilterIndex)
    }

    /// Toggles the completion status of a to-do item and refreshes the filtered list.
    func toggleTodoItemCompletion(_ item: ToDoItem) {
        if let index = allToDoItems.firstIndex(where: { $0.id == item.id }) {
            allToDoItems[index].isDone.toggle()
        }
        applyFilter(at: currentFilterIndex)
    }

    /// Removes a to-do item and refreshes the filtered list.
    func removeTodoItem(_ item: ToDoItem) {
        allToDoItems.removeAll { $0.id == item.id }
        applyFilter(at: currentFilterIndex)
    }

    /// Applies the filter to update the displayed list.
    /// - Parameter index: 0 = All, 1 = Done, 2 = Not Done
    func applyFilter(at index: Int) {
        currentFilterIndex = index
        switch index {
        case 1:
            toDoItems = allToDoItems.filter { $0.isDone }
        case 2:
            toDoItems = allToDoItems.filter { !$0.isDone }
        default:
            toDoItems = allToDoItems
        }
    }
}
