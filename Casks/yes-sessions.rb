cask "yes-sessions" do
  version "9.1.3"
  sha256 "2ecaaf82d5ee2240f3f52f486f61ca2a88ef9e5de86685650ead1ff512fd6a11"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.1.3/Yes-Sessions-9.1.3-arm64.dmg"
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
