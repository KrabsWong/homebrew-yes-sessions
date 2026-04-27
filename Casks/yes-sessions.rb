cask "yes-sessions" do
  version "8.0.1"
  sha256 "7517105fff68d84c5be9c6b632440eafc5a70014ab068f226e3ff18a2fac5301"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.0.1/Yes-Sessions-8.0.1-arm64.dmg"
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
