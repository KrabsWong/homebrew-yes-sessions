cask "yes-sessions" do
  version "8.1.2"
  sha256 "0d9e77fc89f4c49a65a3c274583a210c48dce5e35ae7b58c3d0a223a725c2544"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.1.2/Yes-Sessions-8.1.2-arm64.dmg"
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
