import SwiftUI



struct CustomBottomBar: View {
    @Binding var selectedTab: CustomTabEnum
    
    @Namespace private var namespace
    
    private let barHeight: CGFloat = 60
    private let buttonSize: CGFloat = 60
    
    var body: some View {
        ZStack(alignment: .top) {
            
            DownCurveShape()
                .fill(Color.white)
                .frame(height: barHeight + 50)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: -2)
                .ignoresSafeArea(edges: .bottom)
            
            ZStack {
                FloatingActionButtonView()
            }
            .offset(y: -50)
            
            HStack {
                ForEach(CustomTabEnum.allCases, id: \.self) { tab in
                    if tab == .people {
                        Spacer().frame(width: 80)
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            selectedTab = tab
                        }
                    }) {
                        ZStack {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.ultraThinMaterial)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                                    )
                                    .frame(width: 50, height: 50)
                                
                                    .matchedGeometryEffect(id: "LiquidGlass", in: namespace)
                                    .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                            }
                            
                            
                            Image(tab.iconName)
                                .resizable()
                            
                                .renderingMode(selectedTab == tab ? .original : .template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35) //
                                .foregroundColor(selectedTab == tab ? nil : .black)
                            
                                .opacity(selectedTab == tab ? 1 : 0.7)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: barHeight)
                    }
                }
            }
            .padding(4)
            .frame(height: barHeight)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}


struct DownCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let center = width / 2
        
        
        let curveWidth: CGFloat = 75
        let curveDepth: CGFloat = 35
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: center - curveWidth, y: 0))
        
        path.addCurve(
            to: CGPoint(x: center, y: curveDepth),
            control1: CGPoint(x: center - curveWidth * 0.6, y: 0),
            control2: CGPoint(x: center - curveWidth * 0.35, y: curveDepth)
        )
        
        path.addCurve(
            to: CGPoint(x: center + curveWidth, y: 0),
            control1: CGPoint(x: center + curveWidth * 0.35, y: curveDepth),
            control2: CGPoint(x: center + curveWidth * 0.6, y: 0)
        )
        
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}


enum CustomTabEnum: String, CaseIterable {
    case tent
    case easel
    case people
    case gear
    
    var title: String {
        return rawValue.capitalized
    }
    
    var iconName: String {
        switch self {
        case .tent: return "Courses"
        case .easel: return "Community"
        case .people: return "XMLID 1"
        case .gear: return "Settings"
        }
    }
}

#Preview {
    CustomBottomBar(selectedTab: .constant(.tent))
}
