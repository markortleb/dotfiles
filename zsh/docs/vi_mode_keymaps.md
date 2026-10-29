# My Zsh Vi-Mode Keymaps

`bindkey -v` in `.zshrc` puts the shell's command-line editor (ZLE) into vi mode.
This is a *separate* vi emulation from Neovim's — it only edits the current
command line, not files. You start in **insert mode** on every new prompt.

Cursor shape tells you which mode you're in (configured in `.zshrc`): a
**beam** cursor means insert mode, a **block** cursor means normal (command) mode.

Assume all of these are for Normal ("command") mode unless specified otherwise.


## Mode Switching

- `Esc` -> Enter Normal mode from Insert mode.
- `i` -> Insert before cursor.
- `a` -> Insert after cursor.
- `I` -> Insert at beginning of line.
- `A` -> Insert at end of line.
- `v` -> Open the current command line in `$EDITOR` (nvim) to edit it as a full
  buffer. Write + quit (`:wq`) to run the edited command. *(Custom binding —
  normally `v` starts visual mode; this repo remaps it.)*


## Movement

- `h` / `l` -> Left / right one character.
- `w` / `b` / `e` -> Forward/backward by word / to end of word.
- `0` / `^` / `$` -> Start of line / first non-blank char / end of line.
- `f<char>` / `F<char>` -> Jump to next/previous occurrence of `<char>`.
- `t<char>` / `T<char>` -> Jump to just before/after next/previous `<char>`.
- `;` / `,` -> Repeat last `f`/`F`/`t`/`T`, same/opposite direction.


## Editing

- `x` / `X` -> Delete character under/before cursor.
- `dd` -> Delete (clear) the whole line.
- `d<motion>` -> Delete from cursor per motion (e.g. `dw`, `d$`).
- `cc` -> Change (clear + insert) the whole line.
- `c<motion>` -> Change from cursor per motion (e.g. `cw`).
- `yy` -> Yank (copy) the whole line.
- `p` / `P` -> Paste after / before cursor.
- `u` -> Undo.
- `~` -> Toggle case of character under cursor.
- `.` -> Repeat last change.


## History

- `k` / `j` -> Step to previous/next command in history (literal history
  entries, not prefix-filtered).
- `Up` / `Down` arrows -> Prefix-aware history search (custom binding, works
  in both Insert and Normal mode): type the start of a command, then use the
  arrows to cycle through only history entries that start with it.


## Other Custom Bindings

- `Backspace` -> Deletes the character before the cursor even in Normal mode.
  *(Standard vi mode would move the cursor left instead; this repo remaps it
  for more familiar terminal behavior.)*
