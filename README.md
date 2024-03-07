# `tmux-sessionizer`

## Status

Usable but may be buggy. Fixes may or may not come, features (like saving sessions) may or may not come.

For now this is a little minimal script that does it's thing.

## Description

Open a new [tmux] session inside a directory from a predefined directory-of-directories (read: project directories) list, which works similarly to `PATH`.

Works from outside of and inside [tmux], and whether the [tmux] server is already running or not.

Either specify a directory name as an argument, or [fzf] will be opened for you to find it in specified directories.

Usage: `tmux-sessionizer [-c] NAME`

> [!TIP]
> Aliasing `tmux-sessionizer` as `tms` is really nice for quick usage.

- if NAME is specified, select first directory matching NAME, with the following priority:
    - all directories directly listed in  `TMUX_SESSIONIZER_ADDITIONAL_DIRS`, colon-separated. This is for individual project directories, i have `~/dot` for my dotfiles for example. The default includes it and `~/.dotfiles`
    - all directories in each of directories listed in `TMUX_SESSIONIZER_PATH`, colon-separated. This is for directories containing your project directories at the top level in them, i have `~/pr` and others for example. The default includes it and `~/Documents/Projects`.
- otherwise list every directory inside every directory specified above to choose from with [fzf].

## Options: 

- -c  create directory for the session in `TMUX_SESSIONIZER_DEFAULT_DIR` (default: `~/pr`) if not exists. It will also always create a session in new directory even if `TMUX_SESSIONIZER_DEFAULT_DIR` is not in your `TMUX_SESSIONIZER_PATH`. 

## Installation

- Put `tmux-sessionizer` in your `PATH`. Dependencies: `fzf`, `tmux`.
- Nix flake is available: `nix run github:nativerv/tmux-sessionizer -- my-awesome-project`

## Acknowledgements

- The idea and the base for this script was taken from [The Primeagen] ([original script]). Mine is at least four times more bloated than the original but is a lot more pleasure to use (you can have history in your shell, switch from session to session etc.).

[tmux]: https://github.com/tmux/tmux
[fzf]: https://github.com/junegunn/fzf
[The Primeagen]: https://www.youtube.com/theprimeagen
[original script]: https://github.com/ThePrimeagen/.dotfiles/blob/62eb982a12d75abbdeb6d679504382365456d75c/bin/.local/scripts/tmux-sessionizer
