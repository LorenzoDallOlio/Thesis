ifeq ($(OS), Windows_NT)
	remove = del /s
	empty =  nul
else
	remove = rm
	empty = /dev/null
endif

paper_file = Thesis.tex
paper_out = Thesis


paper: $(paper_file) \
	   $(wildcard Immagini/**/*)
	latexmk -synctex=1 -bibtex -interaction=nonstopmode -file-line-error -pdf $(basename $(paper_file)) -jobname=$(paper_out)
	$(MAKE) clean

.PHONY: clean
clean:
	$(remove) $(paper_out).blg 2> $(empty)
	$(remove) $(paper_out).log 2> $(empty)
	$(remove) $(paper_out).out 2> $(empty)
	$(remove) $(paper_out).fls 2> $(empty)
	$(remove) $(paper_out).synctex.gz 2> $(empty)

.PHONY: cleanall
cleanall: $(paper_out) clean
	@$(remove) $(paper_out).aux 2> $(empty)
	@$(remove) $(paper_out).bbl 2> $(empty)
	@$(remove) $(paper_out).fdb_latexmk 2> $(empty)