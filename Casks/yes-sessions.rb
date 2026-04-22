cask "yes-sessions" do
  version "5.11.0"
  sha256 "73971213104eac8bcd961a74a61a7d0e9faa660f4f7f9be5f2d574896f280d03"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.11.0/Yes-Sessions-5.11.0-arm64.dmg"
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
