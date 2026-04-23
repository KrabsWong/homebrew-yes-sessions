cask "yes-sessions" do
  version "6.0.0"
  sha256 "77d335d1aa4f923680bccdbb8c4db69f31ab6c5d580e4431155723e1867b9870"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v6.0.0/Yes-Sessions-6.0.0-arm64.dmg"
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
