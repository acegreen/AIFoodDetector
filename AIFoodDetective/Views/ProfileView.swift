import SwiftUI
//import Inject

struct ProfileView: View {
    // @ObserveInjection var inject
    @Environment(AuthenticationService.self) private var authService
    @State private var showingSignIn = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Welcome Card
                    CardView {
                        if !authService.isSignedIn {
                            ProfileWelcomeView(showingSignIn: $showingSignIn)
                        } else {
                            ProfileSignedInView()
                        }
                    }

                    // Buy Scans Card
                    NavigationLink(destination: BuyScansView()) {
                        CardView {
                            HStack(spacing: 16) {
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                    .frame(width: 24)

                                Text("Buy Scans")
                                    .font(.headline)
                                    .foregroundColor(.secondary)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    // App Settings Card
                    NavigationLink(destination: SettingsView()) {
                        CardView {
                            HStack(spacing: 16) {
                                Image(systemName: "gearshape.fill")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                    .frame(width: 24)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("App Settings")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                    Text("Food preferences, reminders, notifications...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    // // Donate Card
                    // Button(action: {
                    //     // Handle donate action
                    // }) {
                    //     CardView{
                    //         HStack(spacing: 16) {
                    //             Image(systemName: "heart.fill")
                    //                 .font(.title2)
                    //                 .foregroundColor(.primary)
                    //                 .frame(width: 24)

                    //             VStack(alignment: .leading, spacing: 4) {
                    //                 Text("Donate")
                    //                     .font(.headline)
                    //                     .foregroundColor(.secondary)
                    //                 Text("Donate to AIFoodDetective")
                    //                     .font(.subheadline)
                    //                     .foregroundColor(.secondary)
                    //             }

                    //             Spacer()

                    //             Image(systemName: "arrow.up.forward.square")
                    //                 .foregroundColor(.secondary)
                    //         }
                    //     }
                    // }
                }
                .padding()
            }
            .greenBackground()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
            .whiteNavigationTitle()
            .sheet(isPresented: $showingSignIn) {
                SignInView()
            }
        }
        // .enableInjection()
    }
}

#Preview {
    ProfileView()
        .environment(AuthenticationService.shared)
}
