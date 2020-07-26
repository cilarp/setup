sudo apt install -y texlive-full

echo "#!/usr/bin/env perl" >> ~/.latexmkrc

echo "# LaTeX" >> ~/.latexmkrc
echo "$latex = 'platex -synctex=1 -halt-on-error -file-line-error %O %S';" >> ~/.latexmkrc
echo "$max_repeat = 5;" >> ~/.latexmkrc

echo "# BibTeX" >> ~/.latexmkrc
echo "$bibtex = 'pbibtex %O %S';" >> ~/.latexmkrc
echo "$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';" >> ~/.latexmkrc

echo "# index" >> ~/.latexmkrc
echo "$makeindex = 'mendex %O -o %D %S';" >> ~/.latexmkrc

echo "# DVI / PDF" >> ~/.latexmkrc
echo "$dvipdf = 'dvipdfmx %O -o %D %S';" >> ~/.latexmkrc
echo "$pdf_mode = 3;" >> ~/.latexmkrc

echo "# preview" >> ~/.latexmkrc
echo "$pvc_view_file_via_temporary = 0;" >> ~/.latexmkrc
echo "if ($^O eq 'linux') {" >> ~/.latexmkrc
echo "  $dvi_previewer = \"xdg-open %S\";" >> ~/.latexmkrc
echo "  $pdf_previewer = \"xdg-open %S\";" >> ~/.latexmkrc
echo "} elsif ($^O eq 'darwin') {" >> ~/.latexmkrc
echo "  $dvi_previewer = \"open %S\";" >> ~/.latexmkrc
echo "  $pdf_previewer = \"open %S\";" >> ~/.latexmkrc
echo "} else {" >> ~/.latexmkrc
echo "   $dvi_previewer = \"start %S\";" >> ~/.latexmkrc
echo "   $pdf_previewer = \"start %S\";" >> ~/.latexmkrc
echo "}" >> ~/.latexmkrc

echo "# clean up" >> ~/.latexmkrc
echo "$clean_full_ext = \"%R.synctex.gz\"" >> ~/.latexmkrc