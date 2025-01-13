

.RECIPEPREFIX  :=  $(subst ,, )
h2r            :=  ./.repo-tools/parse-helptext

.PHONY: all clean test

all: README.md

README.md: wikiget $(h2r)
README.md:
  NO_COLOR=1 ./wikiget -h | $(h2r) >README.md

clean:
  rm -rf README.md

test:
  zsh -n wikiget
