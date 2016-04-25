doc = bmvc_review # root 
pdfs=$(doc:%=%.pdf)
dvis=$(doc:%=%.dvi)

all : $(pdfs)

$(pdfs): %.pdf: %.tex *.tex *.bib Makefile # $(dotfigs:%.dot=%.pdf)
	pdflatex $<
	bibtex `basename $< .tex`
	pdflatex $<
	pdflatex $<


# %.ps: %.dvi
# 	dvips $<
# 
# 
# %.pdf: %.dvi
# 	dvipdf $<
# 


clean:
	rm -f $(dvis) $(pdfs)
	rm -f *.aux *.bbl *.log *.blg

