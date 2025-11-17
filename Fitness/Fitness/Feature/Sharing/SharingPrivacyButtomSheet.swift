import SwiftUI

struct SharingPrivacyButtomSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var navigationBarTitle = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(Color.green)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)
                    
                    Text("Activity Sharing & Privacy")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                        .background(
                            GeometryReader { geo in
                                
                                let frame = geo.frame(in: .named("scroll"))
                                
                                Color.clear
                                    .onChange(of: frame.minY) { oldValue, newValue in
                                        
                                        if newValue < 44 {
                                            navigationBarTitle = "Activity Sharing & Privacy"
                                        } else {
                                            navigationBarTitle = ""
                                        }
                                    }
                            }
                        )
                    
                    Text("Activity is designed to protect your information and enable you to choose what you share.")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        _PrivacyBulletPoint(text: "Workout and Activity data shared with friends may include: active calories or kilojoules, exercise minutes, stand or roll hours, steps, time zone, and workout information such as title, type and duration.")
                        _PrivacyBulletPoint(text: "The email address associated with your Apple Account will be visible to anyone you invite or accept an invite from.")
                        _PrivacyBulletPoint(text: "If you use this feature, your Workout and Activity data...")
                    }
                    
                    Text("Apple retains personal data only for as long as necessary to fulfil the purposes for which it was collected, including as described in this notice and in accordance with Apple's Privacy Policy, or as required by law. When assessing retention periods, we first carefully examine whether it is necessary to retain the personal data collected and, if retention is required, work to retain the personal data for the shortest period permissible by law.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("At all times, information collected by Apple will be treated in accordance with Apple's Privacy Policy, which can be found at:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Link("apple.com/uk/privacy", destination: URL(string: "https://www.apple.com/uk/privacy")!)
                            .font(.callout)
                    }
                    
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack(spacing: 8) {
                            Image(systemName: "info.circle")
                            Text("Learn More...")
                        }
                        .font(.callout)
                        .fontWeight(.medium)
                    }
                    .padding(.bottom, 40)
                    
                }
                .padding(.horizontal)
            }
            
            .coordinateSpace(name: "scroll")
            .background(Color(.systemGroupedBackground))
            .navigationTitle(navigationBarTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.primary.opacity(0.7))
                            .padding(8)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

struct _PrivacyBulletPoint: View {
    var text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("•")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text(text)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview{
    SharingPrivacyButtomSheet()
}
