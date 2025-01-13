

.RECIPEPREFIX  :=  $(subst ,, )
h2r            :=  ./.repo-tools/help2readme

all: README.md

README.md: wikiget $(h2r)

README.md:
  NO_COLOR=1 ./wikiget -h | $(h2r) >README.md

clean:
  rm -rf README.md