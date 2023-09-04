# Bedrock

Stepping stones to a better Emacs experience

## Synopsis

An *extremely* minimal Emacs starter kit uses *no* external packages by default, and only GNU-ELPA packages on an opt-in basis. Intended to be copied once and then modified as the user grows in knowledge and power.

 - [Project homepage](https://sr.ht/~ashton314/emacs-bedrock/)
 - [Issue Tracker](https://todo.sr.ht/~ashton314/emacs-bedrock)
 - Mirrors:
   - [GitHub](https://github.com/ashton314/emacs-bedrock) (just a place holder)

**NOTICE:** Requires Emacs 29.1 or better.

## Description

This is a minimal Emacs starter kit. Like, *really* minimal. Here's the short of the philosophy:

 - Focus on using default, built-in Emacs behavior
 
   Yes, we all love our fancy third-party packages. This starter kit focuses on what is built-in to Emacs. Why? Because there are too many good packages and picking and choosing the best is a joy we leave to the user.

 - Explain every customization and encourage modification
 
   The goal of this starter kit is to encourage end-user adaptation and growth. All of the `.el` files should be legible and, more importantly, justify in plain English the rationale for adding the configuration they do.
   
 - No magic
 
   We keep things *crushingly* simple here. That means no fancy loadable modules or whatnot. Everything is as straight-forward as can be.

There are two files of interest: `early-init.el` and `init.el`.

### `early-init.el`

The early init file uses *strictly* built-in Emacs features to do the following:

 - Improve startup time
 - Set up initial frame behavior

### `init.el`

This is where the meat of all configuration goes. This file:

 - Add minor UI niceties (e.g. clock in the tab-bar, full-screen by default, etc.)
 - Set the default theme (`modus-vivendi`)
 - Turn on discovery aids (e.g. `help-quick`, [which-key](https://github.com/justbur/emacs-which-key), etc.)

### Trying this out without committing too hard

Emacs 29.1 added the handy `--init-directory` flag. This means that you can run `emacs --init-directory path/to/emacs-bedrock/` and all the customizations and package installations will be isolated to the project directory. Emacs should only add files that are already in the `.gitignore`.

Once you're happy, you should just copy `init.el` and `early-init.el` to `~/.emacs.d/`.

## Mixins

For those who'd like a little more help in tailoring Emacs for specific purposes, the `mixins/` folder contains a few files that can be included via `(load-file "mixin/mixin-name.el")` from the `init.el` file, or copied wholesale or in part into `init.el` directly.

**NOTE:** If you copy the `mixin/` directory to `~/.emacs.d/` or wherever you're setting `user-emacs-directory`, then simply incrementing the appropriate lines in the `init.el` file should work.

Mixins:

 - Base UI Enhancements
 - Development tools
 - Org-mode
 - Vim refugee
 - Email (TODO: mu4e, EBDB)
 - Researcher (TODO: denote)

#### `mixins/base.el`

Packages this mixin adds:

 - [Avy](https://github.com/abo-abo/avy)
 - [Embark](https://github.com/oantolin/embark)
 - [Vertico](https://github.com/minad/vertico)
 - [Marginalia](https://github.com/minad/marginalia/)
 - [Corfu](https://github.com/minad/corfu)
 - [Consult](https://github.com/minad/consult)
 - [Orderless](https://github.com/oantolin/orderless)

Along with a few ancillary packages that enhance the above.

These are some of the best UI enhancements that Emacs has to offer. Vertico and Consult make common operations like searching files, switching buffers, etc. a breeze. Corfu enhances the "completion at point" (aka "tab-to-complete") to show a little popup window like what you'd be used to in e.g. VS Code. 

Avy is the fastest way to move around in a buffer, and it can do a *lot*.[^1] Embark is kind of like a right-click context menu, but entirely keyboard driven.

#### `mixins/dev.el`

Packages this mixin adds:

 - [magit](https://magit.vc)
 - Markdown, YAML, and JSON modes

Magit is the best Git interface in the known universe. Some people use Emacs just so they can use Magit. It's that good. Entry point is bound to `C-c g` by default.

Built-in packages that this mixin configures:

 - [Eglot](https://github.com/joaotavora/eglot) ([Language Server Protocol (LSP) client](https://microsoft.github.io/language-server-protocol/))
 - Treesit ([Tree-Sitter](https://github.com/tree-sitter) support)

Both of these packages are new in Emacs 29. Be sure to run `M-x treesit-install-language-grammar` to install the language grammar you'll need before editing a file the respective language for the first time.

#### `mixins/vim-like.el`

Packages this mixin adds:

 - [Evil](https://github.com/emacs-evil/evil)

If you like Vim keybindings, then this is the mixin for you. It configures `evil-mode` and enables it, so you get Vim-like keybindings all throughout Emacs. I understand that this is the best Vim emulation outside of Vim itself. I use `evil-mode` in all my work.

Other packages that I use personally, but are not on GNU or non-GNU ELPA and so left out of the config include:

 - [Evil-Collection](https://github.com/emacs-evil/evil-collection) Add Evil-friendly keybindings to lots of corners of Emacs
 - [Evil-Leader](https://github.com/cofi/evil-leader) Setting a prefix (i.e. "leader") key
 - [Origami](https://github.com/gregsexton/origami.el) Code folding

#### `mixins/org.el`

This mixin configures `org-mode`. There is a *lot* that Bedrock cannot configure out of the box—you will need to modify all variables to fit your file system and needs, as explained in comments in the file.

#### `mixins/email.el`

TODO

## Using

Clone this repository wherever. Then you should copy `early-init.el`, `init.el`, and (optionally, recommended) `mixins/` into your `~/.emacs.d/` repository:

```bash
git clone https://git.sr.ht/~ashton314/emacs-bedrock
mkdir -p ~/.emacs.d/
cp emacs-bedrock/early-init.el ~/.emacs.d/
cp emacs-bedrock/init.el ~/.emacs.d/
cp -r emacs-bedrock/mixins ~/.emacs.d/
```

Fire up Emacs and you're good to go!

### Philosophy

Many people are looking for a good set of defaults and some easy-to-use switches that let Emacs get out of the way and let them work on what they want to. This is fine. This is not what Bedrock tries to do.

Emacs is the most customizable piece of software in existence. (No citation needed.) My goal with Bedrock is to make Emacs a little nicer by enabling some things that I personally think should be enabled by default. Bedrock goes a little further by suggesting a few well-built packages that go on to enhance the experience.

Bedrock encourages inspection and modification. I don't plan on making some core that periodically gets updated. You can think of this as just some guy's config that you wanted to adopt.

As an example of a deliberate choice, the `help-quick` buffer pops open on startup. Once a user has gotten used to this, they can just go into their `early-init.el` file and modify it themselves to remove that hook if they don't like it. It's a simple one-line change, and only users who are ready for it will do it.

When I started learning Emacs, my dad gave me his `.emacs` file. (That's what we used back in ye olden days instead of `.emacs.d/init.el` and stuff.) I used it without modification for many years. Eventually I learned how to write my own functions and customizations. This package aims to give other users a similar experience. When someone comes to me and expresses their desire to learn Emacs, I can point them at this to help them get over the initial hump, but not coddle them so much that they're afraid or unable to change things to their liking.

## Requirements

Emacs 29.1 or later.

Emacs 29.1 is, as of 2023-09-04, the latest stable release. The specific features from Emacs 29.1 that Bedrock relies on are:

 - The `use-package` macro for configuration
 - Enhancements to the built-in completion help (`completions-auto-select`, `completion-auto-help`, etc.)
 - Built-in tree-sitter support
 - Built-in LSP client (Eglot)

## Development

This is version `1.0.0`. No new `use-package` declarations will be added to `init.el`. No promises on the mixins. :)

This is a hobby project. Please be patient with development.

I welcome any feedback you may have. You can [open issues](https://todo.sr.ht/~ashton314/emacs-bedrock) or [drop me a line](https://lambdaland.org/#contact) directly with any comments or suggestions.

### Roadmap

See the [issue tracker](https://todo.sr.ht/~ashton314/emacs-bedrock) on SourceHut.

## Changelog

 - 1.0.0
 
   2023-09-04
   
   First "stable" release! Line number width improved, fix default load paths, expand Eglot and Vertico config, fix Corfu load.

 - 0.2.1

   2023-06-20
   
   Minor bug fixes; add Embark package.

 - 0.2.0
 
   2023-03-14
   
   Flesh out the `mixin/vim-like.el` so that there's *some* Vim configuration.

 - 0.1.0
 
   2023-01-17
   
   Begin work on `mixin/org.el`, turn on windmove-mode.

 - 0.0.2

   2023-01-03

   Reorganize to slim down `early-init.el` and add the first mixin files.

 - 0.0.1

   2023-01-03
 
   Initial "release".

## Authors

 - Ashton Wiersdorf https://lambdaland.org

[^1]: https://karthinks.com/software/avy-can-do-anything/
