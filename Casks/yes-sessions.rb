cask "yes-sessions" do
  version "6.2.0"
  sha256 "9c682adc023c797caadbcf92fa3e2fec5e6f3c6a42be414165bf66d7398bee9f"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v6.2.0/Yes-Sessions-6.2.0-arm64.dmg"
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
