cask "yes-sessions" do
  version "11.6.3"
  sha256 "e97aa5181fb40cdddcd62c313e88dd8597e90aabd0ad6ea0d14552030027eccb"

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
