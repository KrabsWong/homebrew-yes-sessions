cask "yes-sessions" do
  version "9.3.0"
  sha256 "caa2a6999006b0c1486766b73dff8f67f593101ade04e172aaeef3a178b21473"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.3.0/Yes-Sessions-9.3.0-arm64.dmg"
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
