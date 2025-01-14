# `wikiget`

_Fetch the wikitext of a wikipedia page_

Examples:

```sh
# These will print the same wikitext:
wikiget https://en.wikipedia.org/wiki/Subtyping
wikiget Subtyping
wikiget 213508           # (the page ID of 'Subtyping')
wikiget                  # ('Subtyping' is the default page)

# Let pandoc convert the wikitext to markdown, page with bat:
wikiget --to=md --pager=bat Subtyping
```

If `bat` is selected as the pager, it is invoked with arguments
providing syntax highlighting for the used output format (wikitext,
markdown).

Rudimentary zsh completions can be generated with

```sh
compdef _gnu_generic wikiget
```

## Requirements

* `jq`
* _optional:_ `bat`, `pandoc`

## `wikiget --help`

```
Fetch the wikitext of a wikipedia page
  

SYNOPSIS

  wikiget [-p|--plain] [-m|--markdown] [--pager[=bat]] <page>


DESCRIPTION

  <page> is interpreted to be

      a page ID,      if integer
      a url,          if it looks like a Wikipedia url
      a page name     otherwise
    
      (If not provided, an example page is fetched.)

  The wikitext is printed to stdout, or displayed with a pager depending
  on used options.

  If `bat` is selected as the pager, it is invoked with arguments
  providing syntax highlighting for the used output format (wikitext,
  markdown).


OPTIONS

      --section=N      only the indicated page section (integer)
      --to=md          convert (pandoc) the wikitext to markdown
      --to=txt         convert (pandoc) the wikitext to plaintext
  -p, --pager          display with $PAGER (or less if unset)
  -b, --pager=bat      display with bat
  -n, --dry-run        no request; use a hard-coded example API reply
  -h, --help           print help


EXAMPLES

  # These will print the same wikitext:
  wikiget https://en.wikipedia.org/wiki/Subtyping
  wikiget Subtyping
  wikiget 213508           # (the page ID of 'Subtyping')
  wikiget                  # ('Subtyping' is the default page)

  # Let pandoc convert the wikitext to markdown, page with bat:
  wikiget --to=md --pager=bat Subtyping


MISC

  If `bat` is selected as the pager, it is invoked with arguments
  providing syntax highlighting for the used output format (wikitext,
  markdown).

  Rudimentary zsh completions can be generated with

      compdef _gnu_generic wikiget
```

