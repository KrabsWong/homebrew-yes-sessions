cask "yes-sessions" do
  version "9.4.1"
  sha256 "08e4b3cb8bac505eae86ce20d3ecd9e4e5d6fe9cfd3a8b3f6c881eea35da7f4d"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.4.1/Yes-Sessions-9.4.1-arm64.dmg"
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
