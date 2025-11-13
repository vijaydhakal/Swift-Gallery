import SwiftUI

// This is the main view that holds the TabView.
// To use this in your app, you would make this your app's starting view.
// Renamed to ContentViews as in your example
struct ContentViews: View {
    
    // --- State and Enum removed ---
    // The @State variable and nested 'enum Tab' were causing a
    // name conflict with the SwiftUI 'Tab' view.
    // They are also not needed for this TabView style.
    
    var body: some View {
        // TabView is the container that creates the tab bar interface.
        
        // --- FIX ---
        // To use `Tab(role: .search)`, all items in the TabView
        // must use the `Tab(...) { ... }` syntax.
        // We cannot mix `.tabItem` modifiers with `Tab` views.
        TabView {
            // --- Converted to Tab syntax ---
            Tab("Summary", systemImage: "circle") {
                HomeView() // Using HomeView, which is defined below
            }
            
            // --- Converted to Tab syntax ---
            Tab("Workout", systemImage: "figure.run") {
                Text("Workout Screen")
            }
            
            // --- Converted to Tab syntax ---
            Tab("Sharing", systemImage: "person.2.fill") {
                Text("Sharing Screen")
            }
            
            // This is the new way to add a standard search tab.
            // This now works because all other items are also `Tab` views.
            Tab(role: .search) {
                SearchView() // Provide a view for the search content
            }
        }
        .tint(.green) // Using your tint color
        // You can set a global accent color for the selected tab icon
        // .accentColor(.blue)
    }
}

// MARK: - Tab Content Views

// A simple placeholder view for the "Home" tab content.
// This is used for your "Summary" tab.
struct HomeView: View {
    
    // --- Add state to hold the search text ---
    @State private var searchText = ""
    
    var body: some View {
        // Wrap in NavigationView to show title and searchable modifier
        NavigationView {
            Text("Welcome to the Home Tab")
                .font(.title)
                .navigationTitle("Home") // Title shown in the navigation bar
            
                // --- Add the .searchable modifier here ---
                // This adds a search bar to the navigation view.
                .searchable(text: $searchText, prompt: "Search...")
        }
    }
}

// --- Re-adding SearchView ---
// This view is now used for the 'Tab(role: .search)'
struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("This is the Search Tab Content")
                .font(.title)
                .navigationTitle("Search")
        }
    }
}

// A simple placeholder view for the "Profile" tab content.
// This view is defined but not currently used in your TabView.
// You can use it if you add a profile tab.
struct ProfileView: View {
    var body: some View {
        Text("This is the Profile Tab")
            .font(.title)
            .navigationTitle("Profile")
    }
}

// MARK: - Preview

// This #Preview macro lets you see your view live in Xcode's canvas.
#Preview {
    ContentViews() // Updated to ContentViews
}
