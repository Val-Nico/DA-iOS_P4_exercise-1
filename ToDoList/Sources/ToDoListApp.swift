import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView(
                viewModel: ToDoListViewModel(
                    repository: ToDoListRepository()
                )
            )
        }
    }
}
