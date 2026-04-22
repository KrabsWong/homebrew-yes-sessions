cask "yes-sessions" do
  version "5.10.1"
  sha256 "af1cdd0f7a8cf647947e714c76fd9c448ab9be98a069ae904fa63c5d9c50b052"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.10.1/Yes-Sessions-5.10.1-arm64.dmg"
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
