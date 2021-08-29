import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State var isHidden: Bool = false
    
    let numTabs = 3
    
    var body: some View {
        TabView(selection: $selectedTab){
            NavigationView{
                StroriesView()
                    .navigationBarHidden(true)
            }.tabItem {
                Image(systemName: "house")
                Text("Strories")
            }.tag(0)
             
            NavigationView{
                Text("Salut, tout le monde!1")
            }.tabItem {
                Image(systemName: "timelapse")
                Text("Space")
            }.tag(1)
            
            NavigationView{
                Text("Salut, tout le monde!2")
            }.tabItem {
                Image(systemName: "timelapse")
                Text("Space")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
