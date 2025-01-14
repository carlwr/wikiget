SHELL          :=  /usr/bin/env zsh
.SHELLFLAGS    +=  -u -o pipefail
MAKEFLAGS      :=  --no-builtin-rules         \
                   --warn-undefined-variables \
                   --no-print-directory
.RECIPEPREFIX  :=  $(subst ,, )


parse            :=  ./.repo-tools/parse-helptext

.PHONY: all clean test

all: README.md

README.md: wikiget $(parse)
README.md:
  NO_COLOR=1 ./wikiget -h \
  | $(parse) --toReadme >README.md

clean:
  rm -rf README.md

test:
  #
  # Sources parsing OK:
  zsh -n wikiget
  zsh -n $(parse)
  #
  # Run examples:
  NO_COLOR=1 ./wikiget -h  \
  | $(parse) --getExamples \
  | zsh -s -o err_exit \
  | wc -l
  #
  #Some dry-run invocations:
  ./wikiget --dry-run          | wc -l
  ./wikiget --dry-run --to=txt | wc -l
  #
  # compdef exits non-zero:
  autoload -U compinit && compinit && compdef _gnu_generic wikiget

