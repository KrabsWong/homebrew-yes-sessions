cask "yes-sessions" do
  version "5.7.15"
  sha256 "bd203a2867f588da75ac4ecc76d7dd6d6ae678cdd72676f29c9b07b665696cbf"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v#{version}/Yes-Sessions-#{version}-arm64.dmg"
  name "Yes Sessions"
  desc "AI Session Manager - Browse and resume your AI conversations"
  homepage "https://github.com/KrabsWong/agent-manager"

  # Only support Apple Silicon
  depends_on arch: :arm64

  app "Yes-Sessions.app"

  zap trash: [
    "~/Library/Application Support/yes-sessions",
    "~/Library/Preferences/com.yes-sessions.plist",
    "~/Library/Logs/yes-sessions",
    "~/Library/Saved Application State/com.yes-sessions.savedState",
  ]
end
