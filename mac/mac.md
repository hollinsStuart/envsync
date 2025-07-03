# MAC Settings

## Softwares

- bartender

## Terminal

### Homebrew

Restoring all installations in Homebrew. I am also keeping a brewlist just in case.

1. Export old configs

```shell
brew bundle dump --file=~/Brewfile --describe
```

2. Move the files to new mac

```shell
scp ~/Brewfile new-mac:~/
```

3. Install Homebrew on new mac
   [Homebrew](https://brew.sh/)

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Ensure brew is in PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

4. Restore everything

```shell
brew bundle --file=~/Brewfile
```

### x-cmd

### Bagel

An app

### Typioca

Practice typing.

### uv

Python env manager.

### glow

Terminal markdown viewer.

### onefetch

### neofetch

### yazi

File manager.

## Neovim settings

@Josean Martinez
