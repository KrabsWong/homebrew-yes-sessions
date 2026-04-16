cask "yes-sessions" do
  version "5.7.16"
  sha256 "fb71bc52949049b6ab90b2f586f72639582903abaf86340944c467ad7b970dad"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.7.16/Yes-Sessions-5.7.16-arm64.dmg"
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
