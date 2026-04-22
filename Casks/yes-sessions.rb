cask "yes-sessions" do
  version "5.10.0"
  sha256 "8d129b9e245488d7a1b8ebac5f827bda834e4aeaf5299b5f83112b5cbb106fd9"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.10.0/Yes-Sessions-5.10.0-arm64.dmg"
  name "Yes Sessions"
  desc "AI Session Manager - Browse and resume your AI conversations"
  homepage "https://github.com/KrabsWong/agent-manager"

  # Only support Apple Silicon
  depends_on arch: :arm64

  app "Yes-Sessions.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/Yes-Sessions.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/yes-sessions",
    "~/Library/Preferences/com.yes-sessions.plist",
    "~/Library/Logs/yes-sessions",
    "~/Library/Saved Application State/com.yes-sessions.savedState",
  ]
end
