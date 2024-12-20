# My dotfiles

This repo contains the dotfiles for my sytem


| Purpose | Tool |
|---------|------|
| Text editor | Neovim |
| Shell | zsh |

## Requirements

Ensure you have the following installed in the sytem:

1. Git
1. Stow
    ```sh
    $ sudo apt install stow
    ```
## Installation

1. First, clone the dotfiles repo into your $HOME directory using Git

    ```
    $ git clone git@github.com/gdnkemboi/dotfiles.git
    $ cd dotfiles
    ```

1. Use GNU Stow to create symlinks

    ```
    $ stow .
    ```

Dotfiles tutorial by [Dreams of Code](https://youtu.be/y6XCebnB9gs?si=MeAfHMy49aZNnrU_)
