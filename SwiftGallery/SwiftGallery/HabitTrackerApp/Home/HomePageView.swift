import SwiftUI

struct HomePageView: View {
    //to detect dark and light theme
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedTab: CustomTabEnum = .tent
    
    let primaryOrange = Color(red: 0.95, green: 0.64, blue: 0.35)
    

    var adaptiveTextColor: Color {
        colorScheme == .dark ? .white : Color(red: 0.2, green: 0.16, blue: 0.18)
    }
    
    var cardBackgroundColor: Color {
        colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : .white
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                Image(colorScheme == .dark ? "scaffold-dark" : "scaffold")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ScrollView {
                    VStack(spacing: 24) {
                        
                        quoteCardView
                        
                        calendarView
                        
                        VStack(spacing: 16) {
                            _HabitRow(title: "Read A Book", color: .orange)
                            _HabitRow(title: "Exercise", color: .red)
                            _HabitRow(title: "Wake Up Early", color: .indigo)
                            _HabitRow(title: "Walk Dog", color: .purple)
                        }
                        
                        Spacer().frame(height: 100)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 18)
                
                CustomBottomBar(selectedTab: $selectedTab)
                    .ignoresSafeArea(.container, edges: .bottom)
            }
            
            .navigationTitle("Homepage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                            .font(.headline)
                            .foregroundColor(adaptiveTextColor)
                            .padding(8)
                            .background(cardBackgroundColor.opacity(0.8))
                            .clipShape(Circle())
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .background(cardBackgroundColor)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
    
    
    var quoteCardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardBackgroundColor)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("WE FIRST MAKE OUR HABITS, AND THEN OUR HABITS MAKES US.")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(adaptiveTextColor)
                        .padding(.bottom, 4)
                    
                    Text("- ANONYMOUS")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Spacer()
                
                Image(systemName: "figure.hiking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .foregroundColor(primaryOrange)
                    .padding()
            }
        }
        .frame(height: 140)
    }
    
    var calendarView: some View {
        VStack(alignment: .leading) {
            Text("HABITS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.leading, 4)
            
            HStack(spacing: 12) {
                _DayCapsule(day: "SUN", date: "17", isSelected: false)
                _DayCapsule(day: "MON", date: "18", isSelected: false)
                _DayCapsule(day: "TUE", date: "18", isSelected: true)
                _DayCapsule(day: "WED", date: "19", isSelected: false)
                _DayCapsule(day: "THU", date: "20", isSelected: false)
            }
        }
    }
}


struct _DayCapsule: View {
    @Environment(\.colorScheme) var colorScheme
    let day: String
    let date: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Text(day)
                .font(.caption2)
                .foregroundColor(isSelected ? .orange : .gray)
            Text(date)
                .font(.headline)
                .foregroundColor(isSelected ? .orange : (colorScheme == .dark ? .white : .black))
        }
        .frame(width: 50, height: 60)
        .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
        .cornerRadius(12)
        
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.orange : Color.clear, lineWidth: 1)
        )
    }
}

struct _HabitRow: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.2, green: 0.16, blue: 0.18))
                .frame(width: 100, alignment: .leading)
            
            Spacer()
            
            HStack(spacing: 8) {
                
                RoundedRectangle(cornerRadius: 4).fill(color).frame(width: 35, height: 35)
                RoundedRectangle(cornerRadius: 4).fill(color.opacity(0.8)).frame(width: 35, height: 35)
                
                _Triangle()
                    .fill(color)
                    .frame(width: 35, height: 35)
                    .background(color.opacity(0.1))
                    .cornerRadius(4)
                
                RoundedRectangle(cornerRadius: 4).fill(color.opacity(0.8)).frame(width: 35, height: 35)
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
        .cornerRadius(16)
    }
}

struct _Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


// Preview Provider
#Preview {
    HomePageView()
}
