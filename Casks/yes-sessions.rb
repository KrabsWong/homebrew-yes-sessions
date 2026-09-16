cask "yes-sessions" do
  version "11.5.0"
  sha256 "5ad1b622363897f66af03062d170ab56fc357ea33c59df662fdaab22a7848907"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v#{version}/Yes-Sessions-#{version}-arm64.dmg"
  name "Yes Sessions"
  desc "Native macOS AI CLI session browser"
  homepage "https://github.com/KrabsWong/yes-sessions"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Yes Sessions.app"

  zap trash: [
    "~/Library/Application Support/yes-sessions",
    "~/Library/Preferences/com.yessessions.app.plist",
    "~/Library/Saved Application State/com.yessessions.app.savedState",
  ]
end
