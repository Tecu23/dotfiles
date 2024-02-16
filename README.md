# Tecu23

## My dotfiles & config files

This directory contains the dotfiles for my system

## Requirements

ENsure you have the following installed on your system

### Git

```
  sudo apt-get install git
```

### Stow

```
  sudo apt-get install stow
```

## Instalation

First, check out the dotfiles repo in your $HOME directory using git

```
  $ git clone git@github.com/Tecu23/Tecu23
  $ cd dotfiles
```

then use GNU stow to create symlinks

```
  $ stow .
```
