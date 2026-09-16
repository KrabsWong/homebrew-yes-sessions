cask "yes-sessions" do
  version "11.5.1"
  sha256 "aab7df306fb3218038526efa555223d2cfafaabaf2c90cb767ca91a85e1b303e"

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
