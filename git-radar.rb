require 'formula'

# Homebrew formula that installs git-radar
class GitRadar < Formula
  homepage 'https://github.com/mcphailtom/git-radar'
  url 'https://github.com/mcphailtom/git-radar/releases/download/v0.6.1/git-radar-0.6.1.tar.gz'
  sha256 'e0b0f3bb69f14378ca5881f84922d9ca64803c636b8e5413e3af91aae9eeac3a'

  head 'https://github.com/mcphailtom/git-radar.git'

  depends_on 'coreutils'

  def install
    libexec.install 'git-radar'
    libexec.install 'radar-base.sh'
    libexec.install 'prompt.zsh'
    libexec.install 'prompt.bash'
    libexec.install 'fetch.sh'
    bin.install_symlink libexec/'git-radar'

    ohai "Bash and Zsh installation
Bash
  export PS1=\"\W\$(git-radar --bash --fetch) \"
Zsh
  export PROMPT=\"%1/%\$(git-radar --zsh --fetch) \"
"
  end
end
