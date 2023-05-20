# Behind The Scenes

This mdbook is my first serious attempt at writing in basic markdown (as opposed to something serious like LaTeX)
  and then using processing tools to convert the sources into formats for web, print and so forth.

To start with, this section will be largely self Q&A but I will revamp it later to try and give an onboarding
guide.

## Image Handling

Images can be linked using the `![Alt Text](path/to/image.sfx)` notation.  However, if it is necessary to supply
controls on the image size, location, text wrapping around and other presentational definitions, more is needed.

## Diagram Support

I'm a big fan of text based diagram languages (graphviz/dot, mermaid and a plethora of LaTeX tools).

## LaTeX

How to properly do LaTeX typesetting within mdbook?

## Extensions and TGhemes

- [mdbook-theme](https://crates.io/crates/mdbook-theme)
- [mdbook-compress](https://crates.io/crates/mdbook-compress) to render as a single PDF file.

## Cargo and Rust Notes
