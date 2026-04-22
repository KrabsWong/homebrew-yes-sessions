cask "yes-sessions" do
  version "5.9.1"
  sha256 "da98282ab7166bb738d6212e5531bf2002e3b16bdc7859da4a4d2a2d1962fb00"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.9.1/Yes-Sessions-5.9.1-arm64.dmg"
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
