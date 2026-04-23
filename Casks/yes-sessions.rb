cask "yes-sessions" do
  version "6.1.0"
  sha256 "a229010b32193472aa4b2a87f0fb797273ef82d40e97459d7c01bdfddd5779fc"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v6.1.0/Yes-Sessions-6.1.0-arm64.dmg"
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
