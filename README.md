# cfg

My personal dotfiles repo.

## Rationale

I like to keep my configuration files (aka dotfiles) under version control. Unfortunately these
files usually have to live in specific places where version control is impractical (e.g. my home
directory). Enter ***symlinks!*** With symlinks I can store all of my dotfiles in one (version
controlled) directory, and have symlinks to each file in the appropriate place on the system. Now
whenever I make a change to some rc file it will be reflected in the associated file in my config
directory and I can commit the changes if I so choose. This also helps me keep my dotfiles in sync
across different machines, and helps me get up and running quickly on a new OS install.

Unfortunately on new systems it can be a pain to track down where each dotfile lives and make a
symlink for it. Enter [***`dotconfig`!***][`dotconfig`] `dotconfig` is a
tool I created to quickly and easily generate all of the symlinks I want, in a flexible way.

## Installation with [`dotconfig`]

Install `dotconfig`:
```
cargo install dotconfig
```
Edit `symlinks.yml` to reflect your needs, then run
```
dotconfig
```
and all of your files will be symlinked!


[`dotconfig`]: https://github.com/mfdorst/dotconfig
