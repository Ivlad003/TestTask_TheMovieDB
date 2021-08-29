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
                Image(systemName: "film.fill")
                Text("Strories")
            }.tag(0)
             
            NavigationView{
                Text("No result")
            }.tabItem {
                Image(systemName: "film.fill")
                Text("Video")
            }.tag(1)
            
            NavigationView{
                Text("No result")
            }.tabItem {
                Image(systemName: "star.circle.fill")
                Text("Favourites")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
