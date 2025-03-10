import SwiftUI

struct ContentView: View {
    @ObservedObject var gameController = GameController()
    
    var body: some View {
        ZStack {
            GameUIViewControllerRepresentable(gameController: gameController)
        }
    }
}
