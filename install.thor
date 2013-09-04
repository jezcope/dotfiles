module Helpers

  def texmf_location
    case RUBY_PLATFORM
    when /darwin/
      "Library/texmf"
    else
      "texmf"
    end
  end

end

class Dotfiles < Thor
  include Thor::Actions
  include Helpers

  DOTLINKS = %w(zshrc zshenv zsh vimrc vim emacs.d pentadactyl pentadactylrc xmonad gitconfig gitignore.global htmltidy.conf ackrc)

  desc "install", "Set up symlinks in the right places"
  def install(dest="~")
    self.destination_root = dest

    say "Installing to #{dest}..."

    DOTLINKS.each do |f|
      link_file f, ".#{f}"
    end

    link_file 'texmf', texmf_location
    link_file 'sharedbin', "bin/shared"
  end

  def self.source_root
    File.dirname(__FILE__)
  end

end
