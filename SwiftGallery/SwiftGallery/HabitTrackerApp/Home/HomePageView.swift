import SwiftUI


struct HomePageView: View {
    @State private var selectedTab: CustomTabEnum = .tent
  
    let creamBackground = Color(red: 0.99, green: 0.96, blue: 0.91)
    let primaryOrange = Color(red: 0.95, green: 0.64, blue: 0.35)
    let darkText = Color(red: 0.2, green: 0.16, blue: 0.18)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            creamBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                   
                    headerView
                    
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
                .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomBottomBar(selectedTab: $selectedTab).ignoresSafeArea(.container, edges: .bottom)
        }
    }
    
    
    var headerView: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .clipShape(Circle())
                    .foregroundColor(darkText)
            }
            
            Spacer()
            
            Text("Homepage")
                .font(.headline)
                .foregroundColor(darkText)
            
            Spacer()
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
    }
    
    var quoteCardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("WE FIRST MAKE OUR HABITS, AND THEN OUR HABITS MAKES US.")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(darkText)
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
                .foregroundColor(isSelected ? .orange : .black)
        }
        .frame(width: 50, height: 60)
        .background(Color.white)
        .cornerRadius(12)
       
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.orange : Color.clear, lineWidth: 1)
        )
    }
}

struct _HabitRow: View {
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(red: 0.2, green: 0.16, blue: 0.18))
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
        .background(Color.white)
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
