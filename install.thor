class Dotfiles < Thor
  include Thor::Actions

  DOTLINKS = %w(zshrc zshenv zsh vimrc vim pentadactyl pentadactylrc xmonad gitconfig gitignore.global htmltidy.conf)

  desc "install", "Set up symlinks in the right places"
  def install(dest="~")
    self.destination_root = dest

    say "Installing to #{dest}..."

    DOTLINKS.each do |f|
      link_file f, ".#{f}"
    end

    link_file 'texmf', "texmf"
    link_file 'sharedbin', "bin/shared"
  end

  def self.source_root
    File.dirname(__FILE__)
  end

end
