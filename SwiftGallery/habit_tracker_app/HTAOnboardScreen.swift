import SwiftUI


struct OnboardingScreen: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: AttributedString
}

private func _createSubtitle(base: String, highlighted: String) -> AttributedString {
    var attrString = AttributedString(base + highlighted)
    attrString.foregroundColor = .secondary
    attrString.font = .subheadline.weight(.medium)
    if let range = attrString.range(of: highlighted) {
        attrString[range].foregroundColor = .orange
        attrString[range].font = .subheadline.weight(.bold)
    }
    return attrString
}

private let onboardingData: [OnboardingScreen] = [
    OnboardingScreen(
        imageName: "HTA_onboard1",
        title: "WELCOME TO CELESTIAL HABITS",
        subtitle: _createSubtitle(base: "WE CAN HELP YOU TO BE A BETTER VERSION OF ", highlighted: "YOURSELF.")
    ),
    OnboardingScreen(
        imageName: "HTA_onboard2",
        title: "CREATE NEW HABIT EASILY",
        subtitle: _createSubtitle(base: "Set reminders and goals to stay ", highlighted: "CONSISTENT.")
    ),
    OnboardingScreen(
        imageName: "HTA_onboard3",
        title: "KEEP TRACK OF YOUR PROGRESS",
        subtitle: _createSubtitle(base: "Track your progress with detailed ", highlighted: "STATS.")
    ),
    OnboardingScreen(
        imageName: "HTA_onboard4",
        title: "JOIN A SUPPORTIVE COMMUNITY",
        subtitle: _createSubtitle(base: "Share your journey and get ", highlighted: "MOTIVATED.")
    )
]

struct OnboardingView: View {
    
    @AppStorage("showOnboarding") var showOnboarding = true
    
    @State private var currentPage = 0
    
    
    private var isLastPage: Bool {
        currentPage == onboardingData.count - 1
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(onboardingData.indices, id: \.self) { index in
                        _SingleOnboardingScreenView(screen: onboardingData[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.default, value: currentPage)
                
                HStack(spacing: 20) {
                    Button("Skip") {
                        withAnimation {
                            currentPage = onboardingData.count - 1
                        }
                    }
                    .buttonStyle(.plain)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .opacity(isLastPage ? 0 : 1)
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        ForEach(onboardingData.indices, id: \.self) { index in
                            Circle()
                                .fill(index == currentPage ? .primary : .secondary)
                                .frame(width: 8, height: 8)
                                .animation(.spring(dampingFraction: 0.5), value: currentPage)
                        }
                    }
                    Spacer()
                    if isLastPage {
                        Button("Get Started") {
                            showOnboarding = false
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                    } else {
                        Button("Next") {
                            withAnimation {
                                currentPage += 1
                            }
                        }
                        .buttonStyle(.plain)
                        .font(.headline)
                        .foregroundStyle(.orange)
                    }
                }
                .padding()
                .frame(height: 70)
            }
        }
    }
}

struct _SingleOnboardingScreenView: View {
    let screen: OnboardingScreen
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text(screen.title)
                .font(.title2.weight(.bold))
                .fontDesign(.rounded)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
            
            
            Image(screen.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
            
            Text(screen.subtitle)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

#Preview{ OnboardingView()}

