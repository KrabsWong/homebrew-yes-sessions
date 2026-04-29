cask "yes-sessions" do
  version "8.2.0"
  sha256 "2f20114ce3c4b2cdaef15955dfa6d4180842624a6fc1f2e0e2716585d7118cef"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.2.0/Yes-Sessions-8.2.0-arm64.dmg"
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
