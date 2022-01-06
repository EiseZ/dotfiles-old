# Dotfiles

These's are the dotfiles I use on my main pc.

## Installation

clone the git repo

```sh
git clone https://github.com/EiseZ/dotfiles.git
```

install stow (example for voidlinux)

```sh
sudo xbps-install stow
```

make stow do it's thing

```sh
stow */
```

## Packages

There is also a list of the packages I have installed (manualy)

to install them (on voidlinux)

```sh
sudo xbps-install -S $(cat packages.txt)
```

## Extra Files

Files: (name) -> (location in repo) -> (location on system)

-   xorg.conf -> X11/.config/X11/xorg.conf -> /etc/X11/xorg.conf
