cask "yes-sessions" do
  version "11.2.6"
  sha256 "6a02637ed2913d64df08c83f17f072de2cecd4606ce89de37d22ccc1d88f14f1"

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
