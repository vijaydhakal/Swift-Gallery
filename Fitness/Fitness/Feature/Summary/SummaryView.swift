import SwiftUI


struct SummaryView: View {
    
    @State private var showTitle = false
    private let titleScrollTrigger: CGFloat = -40
    
    @State private var showTrendsBottomSheet = false
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    GeometryReader { geo in
                        let frame = geo.frame(in: .named("scroll"))
                        
                        let newShowTitle = frame.minY < self.titleScrollTrigger
                        
                        if newShowTitle != self.showTitle {
                            DispatchQueue.main.async {
                                self.showTitle = newShowTitle
                            }
                        }
                        
                        return Color.clear
                    }
                    .frame(height: 1)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Summary")
                                .font(.largeTitle.bold())
                            
                            Text("Wednesday, 12 Nov")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(Color.yellow.opacity(0.8))
                            .clipShape(Circle()).contentMargins(20)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                    }
                    .padding()
                    
                    
                    Text("Activity Ring")
                        .font(.title2.bold())
                        .padding(.horizontal)
                    
                    ActivityRingsView()
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        StatCardView(
                            title: "Step Count",
                            value: "2.537",
                            color: .purple,
                            graphType: .bar
                        )
                        StatCardView(
                            title: "Step Distance",
                            value: "1,60KM",
                            color: .blue,
                            graphType: .bar
                        )
                    }
                    .padding(.horizontal)
                    LazyVGrid(columns: columns, spacing: 16) {
                        SessionsView(iconName: "figure.basketball", iconColor: .secondary, title: "Sessions", value: "value", subtitle: "sub title")
                        SessionsView(iconName: "figure.walk.motion", iconColor: .secondary, title: "Awards", value: "value", subtitle: "sub title")
                    }
                    .padding(.horizontal)
                    
                    TrendsView(showTrendSheetSheet: $showTrendsBottomSheet)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.top)
            }
            .navigationBarHidden(!showTitle)
            .navigationTitle( "Summary" )
            .navigationSubtitle("Wednesday, 12 Nov")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $showTrendsBottomSheet) {
                TrendsBottomSheetView()
                    .presentationDetents([.large])
            }
        }
        
    }
}


#Preview {
    SummaryView()
}
