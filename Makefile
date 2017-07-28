FILE=manuscript

all: $(FILE).pdf

.PHONY: clean

clean:
	rm -rf *.blg 
	rm -rf *.out 
	rm -rf *.bbl 
	rm -rf *.log
	rm -rf *.ind
	rm -rf *.ilg
	rm -rf *.lot
	rm -rf *.lof
	rm -rf *.ind
	rm -rf *.idx
	rm -rf *.aux
	rm -rf *.toc


$(FILE).pdf: *.tex *.bib
	pdflatex -shell-escape $(FILE).tex
	pdflatex -shell-escape $(FILE).tex
	bibtex $(FILE)
	pdflatex -shell-escape $(FILE).tex
	pdflatex -shell-escape $(FILE).tex

git: $(FILE).pdf clean
	git add --all .
	git commit -m "Makefile commit"
	git push
