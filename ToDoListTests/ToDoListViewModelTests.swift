import XCTest
import Combine
@testable import ToDoList

final class ToDoListViewModelTests: XCTestCase {
    // MARK: - Properties
    
    private var viewModel: ToDoListViewModel!
    private var repository: MockToDoListRepository!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = MockToDoListRepository()
        viewModel = ToDoListViewModel(repository: repository)
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        viewModel = nil
        repository = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAddTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        
        // When
        viewModel.add(item: item)
        
        // Then
        XCTAssertEqual(viewModel.toDoItems.count, 1)
        XCTAssertTrue(viewModel.toDoItems[0].title == "Test Task")
    }
    
    func testToggleTodoItemCompletion() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.add(item: item)
        
        // When
        viewModel.toggleTodoItemCompletion(item)
        
        // Then
        XCTAssertTrue(viewModel.toDoItems[0].isDone)
    }
    
    func testRemoveTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.toDoItems.append(item)
        
        // When
        viewModel.removeTodoItem(item)
        
        // Then
        XCTAssertTrue(viewModel.toDoItems.isEmpty)
    }
    
    func testFilteredToDoItems() {
        // Given
        let item1 = ToDoItem(title: "Task 1", isDone: true)
        let item2 = ToDoItem(title: "Task 2", isDone: false)
        viewModel.add(item: item1)
        viewModel.add(item: item2)
        
        // When
        viewModel.applyFilter(at: 0)
        // Then
        XCTAssertEqual(viewModel.toDoItems.count, 2)
        
        // When
        viewModel.applyFilter(at: 1)
        // Then
        XCTAssertEqual(viewModel.toDoItems.count, 1)
        
        // When
        viewModel.applyFilter(at: 2)
        // Then
        XCTAssertEqual(viewModel.toDoItems.count, 1)
    }
}
