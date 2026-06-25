cask "yes-sessions" do
  version "9.3.1"
  sha256 "b8840c4edcc3cfbd211dbb5b581425f1aecf4c6c0d9b09863eeea118baae5f38"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.3.1/Yes-Sessions-9.3.1-arm64.dmg"
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
