//import SwiftUI
//
//struct FitnessContentView: View {
//    var body: some View {
//        TabView {
//            // MARK: - Summary Tab
//            SummaryView()
//                .tabItem {
//                    Image(systemName: "chart.bar.xaxis")
//                    Text("Summary")
//                }
//            
//            // MARK: - Placeholder Tabs
//            Text("Workout Screen")
//                .tabItem {
//                    Image(systemName: "figure.run")
//                    Text("Workout")
//                }
//            
//            Text("Sharing Screen")
//                .tabItem {
//                    Image(systemName: "person.2.fill")
//                    Text("Sharing")
//                }
//        }
//        // We force dark mode to match the screenshot
//        // .preferredColorScheme(.dark) // Removed to support light/dark mode
//        // Set the accent color for the selected tab item
//        .tint(.green)
//    }
//}
//
//// This view represents the main "Summary" screen content
//struct SummaryView: View {
//    
//    // Define the columns for the grid
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: 16),
//        GridItem(.flexible(), spacing: 16)
//    ]
//    
//    var body: some View {
//        NavigationView {
//            // Main scrolling content
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    // MARK: - Header
//                    Text("Friday, 7 Nov")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                        .padding(.horizontal)
//                    
//                    // MARK: - Activity Ring
//                    Text("Activity Ring")
//                        .font(.title2.bold())
//                        .padding(.horizontal)
//                    
//                    ActivityRingsView()
//                        .padding(.horizontal)
//                    
//                    // MARK: - Stats Grid
//                    LazyVGrid(columns: columns, spacing: 16) {
//                        StatCardView(
//                            title: "Step Count",
//                            value: "2.537", // Updated value
//                            color: .purple,
//                            graphType: .bar
//                        )
//                        StatCardView(
//                            title: "Step Distance",
//                            value: "1,60KM", // Updated value
//                            color: .blue,
//                            graphType: .bar
//                        )
//                    }
//                    .padding(.horizontal)
//                    
//                    // MARK: - List Cards (Using new EmptyStateCardView)
//                    EmptyStateCardView(
//                        title: "Sessions",
//                        iconName: "figure.run",
//                        iconColor: .green
//                    )
//                    .padding(.horizontal)
//                    
//                    EmptyStateCardView(
//                        title: "Awards",
//                        iconName: "rosette",
//                        iconColor: .pink
//                    )
//                    .padding(.horizontal)
//                    
//                    Spacer()
//                }
//                .padding(.top)
//            }
//            // .background(Color.black.edgesIgnoringSafeArea(.all)) // Removed to support light/dark mode
//            .navigationTitle("Summary")
//            .toolbar {
//                // Profile icon in the navigation bar
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    // Using a generic person icon as placeholder for the photo
//                    Image(systemName: "person.crop.circle.fill")
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(.yellow.opacity(0.8))
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Reusable Components
//
///// The Activity Rings view with stats
//struct ActivityRingsView: View {
//    var body: some View {
//        HStack(spacing: 20) {
//            // ZStack to layer the three rings
//            ZStack {
//                RingView(
//                    progress: 51 / 120.0, // Move
//                    color: .red,
//                    lineWidth: 20,
//                    size: 140
//                )
//            }
//            .frame(width: 140, height: 140)
//            
//            // Stats text next to the rings
//            VStack(alignment: .leading, spacing: 4) {
//                Text("Move")
//                    .font(.body)
//                    .foregroundColor(.red)
//                
//                // Custom layout for "51/120 KCAL"
//                HStack(alignment: .firstTextBaseline, spacing: 2) {
//                    Text("51")
//                        .font(.system(size: 28, weight: .semibold))
//                        .foregroundColor(.primary) // Changed from .white
//                    Text("/")
//                        .font(.body.weight(.medium))
//                        .foregroundColor(.red)
//                        .padding(.top, 8) // Align with baseline
//                    Text("120 KCAL")
//                        .font(.body.weight(.medium))
//                        .foregroundColor(.red)
//                        .padding(.top, 8) // Align with baseline
//                }
//            }
//            
//            Spacer() // Push content to the left
//        }
//        .padding()
//        .background(.thinMaterial) // Changed from Color.secondary
//        .cornerRadius(20)
//        .contextMenu {
//            Button {
//                // Add edit action here
//                print("Edit Activity Rings")
//            } label: {
//                Label("Edit", systemImage: "pencil")
//            }
//            
//            Button(role: .destructive) { // Use destructive role for "Hide"
//                // Add hide action here
//                print("Hide Activity Rings")
//            } label: {
//                Label("Hide", systemImage: "minus.circle")
//            }
//        } // Removed preview closure for subtle context menu
//    }
//}
//
///// A single colored ring for the Activity Rings
//struct RingView: View {
//    let progress: Double
//    let color: Color
//    let lineWidth: CGFloat
//    let size: CGFloat
//    
//    var body: some View {
//        ZStack {
//            // Background ring
//            Circle()
//                .stroke(color.opacity(0.3), lineWidth: lineWidth)
//            
//            // Progress ring
//            Circle()
//                .trim(from: 0, to: min(progress, 1.0)) // Use min to cap at 1.0
//                .stroke(
//                    color,
//                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
//                )
//                .rotationEffect(.degrees(-90)) // Start from the top
//            
//            // Arrow at the end of the progress
//            // Show arrow if progress is between 0 and 1 (not at start, not fully complete)
//            if progress > 0.01 && progress < 1.0 {
//                Image(systemName: "arrow.forward") // Using SFSymbol
//                    .font(.system(size: lineWidth * 0.35, weight: .bold)) // Made arrow smaller (35% of line width, was 50%)
//                    .foregroundColor(Color(UIColor.systemBackground)) // Changed from .white
//                    .frame(width: lineWidth, height: lineWidth) // Keep it centered on the line
//                    .offset(y: -size / 2) // Move to the top (12 o'clock) position
//                    .rotationEffect(.degrees(min(progress, 1.0) * 360)) // Rotate around the center
//            }
//        }
//        .frame(width: size, height: size)
//    }
//}
//
///// A card for the grid (Steps, Distance)
//struct StatCardView: View {
//    let title: String
//    let value: String
//    let color: Color
//    let graphType: GraphType
//    
//    enum GraphType { case bar, none }
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Text(title)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                Spacer()
//                Image(systemName: "chevron.right")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//            }
//            
//            Text(value)
//                .font(.system(size: 28, weight: .semibold))
//                .foregroundColor(color)
//            
//            // Display the new SmallBarGraphView
//            if graphType == .bar {
//                
//                // --- THIS IS THE CHANGE ---
//                // Pass in your desired line width.
//                // Try a smaller value like 2.0 or 1.5.
//                SmallBarGraphView(graphColor: color, lineWidth: 2.0)
//                    .frame(height: 80)
//                
//            }
//            
//            // The "Today" text is now part of the SmallBarGraphView
//            
//        }
//        .padding()
//        .background(.thinMaterial)
//        .cornerRadius(20)
//        .contextMenu {
//            Button(role: .destructive) {
//                // Add delete action here
//                print("Delete \(title)")
//            } label: {
//                Label("Delete", systemImage: "trash")
//            }
//            
//            Button {
//                // Add share action here
//                print("Share \(title)")
//            } label: {
//                Label("Share", systemImage: "square.and.arrow.up")
//            }
//        }
//    }
//}
///// A card for the list (Sessions, Awards) - RETAINED for potential future use
//struct ListCardView: View {
//    let iconName: String
//    let iconColor: Color
//    let title: String
//    let value: String? // Made optional
//    let subtitle: String? // Made optional
//    
//    var body: some View {
//        HStack(spacing: 16) {
//            Image(systemName: iconName)
//                .font(.title)
//                .foregroundColor(iconColor)
//                .frame(width: 30)
//            
//            VStack(alignment: .leading) {
//                Text(title)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                
//                if let value = value {
//                    Text(value)
//                        .font(.headline)
//                        .foregroundColor(.white)
//                }
//                if let subtitle = subtitle {
//                    Text(subtitle)
//                        .font(.caption)
//                        .foregroundColor(.secondary)
//                }
//            }
//            
//            Spacer()
//            
//            Image(systemName: "chevron.right")
//                .font(.body)
//                .foregroundColor(.secondary)
//        }
//        .padding()
//        .background(Color.secondary.opacity(0.2))
//        .cornerRadius(20)
//        .contextMenu {
//            Button(role: .destructive) {
//                print("Delete \(title)")
//            } label: {
//                Label("Delete", systemImage: "trash")
//            }
//            
//            Button {
//                // Add share action here
//                print("Share \(title)")
//            } label: {
//                Label("Share", systemImage: "square.and.arrow.up")
//            }
//        }
//    }
//}
//
///// New card for empty states like Sessions and Awards
//struct EmptyStateCardView: View {
//    let title: String
//    let iconName: String
//    let iconColor: Color
//    
//    var body: some View {
//        ZStack(alignment: .leading) {
//            // Faint icon in the center
//            Image(systemName: iconName)
//                .font(.system(size: 40))
//                .foregroundColor(iconColor.opacity(0.3)) // Increased opacity
//                .frame(maxWidth: .infinity, alignment: .center)
//            
//            // Content (Title and Chevron)
//            HStack(alignment: .top) {
//                Text(title)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                
//                Spacer()
//                
//                Image(systemName: "chevron.right")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//            }
//        }
//        .padding()
//        .frame(height: 120) // Increased height from 100
//        .background(.thinMaterial) // Changed from Color.secondary
//        .cornerRadius(20)
//        .contextMenu {
//            // Context menu for consistency
//            Button {
//                print("Edit \(title)")
//            } label: {
//                Label("Edit", systemImage: "pencil")
//            }
//            
//            Button(role: .destructive) {
//                print("Hide \(title)")
//            } label: {
//                Label("Hide", systemImage: "minus.circle")
//            }
//        }
//    }
//}
//
//
///// A more detailed bar graph with labels
//struct SmallBarGraphView: View {
//    let graphColor: Color
//    // Tweaked heights to better match screenshot
//    let barHeights: [CGFloat] = [0.2, 0.1, 0.4, 0.3, 0.2, 0.1, 0.2, 0.6, 0.3, 0.5, 0.2, 0.1]
//    let labels = ["12 AM", "6 AM", "12 PM", "6 PM"]
//    
//    var body: some View {
//        VStack(spacing: 4) {
//            // Bars
//            HStack(alignment: .bottom, spacing: 2) {
//                ForEach(barHeights.indices, id: \.self) { index in
//                    // Faint background bar
//                    RoundedRectangle(cornerRadius: 1.5)
//                        .fill(graphColor.opacity(0.3))
//                        .frame(height: 70) // Increased height from 50
//                        .overlay(alignment: .bottom) {
//                            // Foreground active bar
//                            if barHeights[index] > 0.15 { // Only show prominent bars
//                                RoundedRectangle(cornerRadius: 1.5)
//                                    .fill(graphColor)
//                                    .frame(height: barHeights[index] * 70) // Increased height from 50
//                            }
//                        }
//                }
//            }
//            .frame(height: 70) // Increased height from 50
//            
//            // Labels
//            HStack {
//                ForEach(labels.indices, id: \.self) { index in
//                    Text(labels[index])
//                        .font(.system(size: 8))
//                        .foregroundColor(.secondary)
//                    if index < labels.count - 1 {
//                        Spacer()
//                    }
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//
//#Preview {
//    FitnessContentView()
//}
