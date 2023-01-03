# Bedrock

Stepping stones to a better Emacs experience

## Synopsis

An *extremely* minimal Emacs starter kit uses *no* external packages by default, and only ELPA packages on an opt-in basis. Intended to be copied once and then modified as the user grows in knowledge and power.

## Description

This is a minimal Emacs starter kit. Like, *really* minimal. Here's the short of the philosophy:

 - Focus on using default, built-in Emacs behavior
 
   Yes, we all love our fancy third-party packages. This starter kit focuses on what is built-in to Emacs. Why? Because there are too many good packages and picking and choosing the best is a joy we leave to the user.

 - Explain every customization
 
   The goal of this starter kit is to encourage end-user adaptation and growth. All of the `.el` files should be legible and, more importantly, justify in plain English the rationale for adding the configuration they do.

 - No magic
 
   We keep things *crushingly* simple here. That means no fancy loadable modules or whatnot. Everything is as straight-forward as can be.

## Requirements

Emacs 29.1 or later.

Yes, as of writing, Emacs 29.1 hasn't been released yet. The reason why is because we are relying on `use-pacakge` to be built-in.

## Authors

 - Ashton Wiersdorf
