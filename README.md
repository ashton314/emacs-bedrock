# Bedrock

Stepping stones to a better Emacs experience

## Synopsis

An *extremely* minimal Emacs starter kit uses *no* external packages by default, and only GNU-ELPA packages on an opt-in basis. Intended to be copied once and then modified as the user grows in knowledge and power.

 - [Project homepage](https://sr.ht/~ashton314/emacs-bedrock/)
 - [Issue Tracker](https://todo.sr.ht/~ashton314/emacs-bedrock)
 - Mirrors:
   - [GitHub](https://github.com/ashton314/emacs-bedrock)

## Description

**ACHTUNG!**

This makes use of some Emacs 29.1 features! Fortunately these features should all be stable, but you will have serious troubles if you try using this unmodified on anything earlier. (Features: `help-quick`, built-in `use-package`.)

For testing, you can run `emacs --init-directory path/to/emacs-bedrock/` and all the customizations and package installations will be isolated to the project directory. Emacs should only add files that are already in the `.gitignore`.

--------------------------------------------------------------------------------

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

### Mixins

For those who'd like a little more help in tailoring Emacs for specific purposes, the `mixins/` folder contains a few files that can be included via `(load-file "mixin/mixin-name.el")` from the `init.el` file, or copied wholesale or in part into `init.el` directly.

Mixins:

 - UI Enhancements
 - Development tools
 - Org-mode (in development)
 - Email (TODO: mu4e, EBDB)
 - Researcher (TODO: citar, denote, org-roam, LaTeX)
 - Vim refugee (TODO: evil-mode)

#### `mixins/ui.el`

Packages this mixin uses:

 - [avy](https://github.com/abo-abo/avy)
 - [vertico](https://github.com/minad/vertico)
 - [marginalia](https://github.com/minad/marginalia/)
 - [corfu](https://github.com/minad/corfu)
 - [consult](https://github.com/minad/consult)
 - [orderless](https://github.com/oantolin/orderless)

Along with a few ancillary packages that enhance the above.

#### `mixins/dev.el`

Packages this mixin uses:

 - [magit](https://magit.vc)

## Using

Clone this repository wherever. Then you should copy `early-init.el` and `init.el` into your `~/.emacs.d/` repository:

```bash
git clone https://git.sr.ht/~ashton314/emacs-bedrock
mkdir -p ~/.emacs.d/
cp emacs-bedrock/early-init.el ~/.emacs.d/
cp emacs-bedrock/init.el ~/.emacs.d/
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

Yes, as of writing, Emacs 29.1 hasn't been released yet. The reason why is because we are relying on `use-pacakge` to be built-in.

## Development

This is version `0.1.0`.

Once I am happy with the state of things, I'll change it to version `1.*.*`—at that point, no new `use-package` declarations will be added to `init.el`.

This is a hobby project. Please be patient.

### Roadmap

See the [issue tracker](https://todo.sr.ht/~ashton314/emacs-bedrock) on SourceHut.

## Changelog

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
