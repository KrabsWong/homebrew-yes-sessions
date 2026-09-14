cask "yes-sessions" do
  version "11.4.2"
  sha256 "bae5a4a2db63f8b04c23438b78c12c83d2aed36de7150b6cd21abc84c90b72fa"

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
