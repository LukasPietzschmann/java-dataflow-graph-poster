@default_files = ('main.tex');
$pdf_mode = 4;
$aux_dir = 'aux';
$out_dir = 'out';
$lualatex = 'lualatex -shell-escape';
$biber = "biber --validate-datamodel %O %S";
$clean_ext = 'nav out snm';
$show_time = 1;
$bibtex_use = 2;
push @generated_exts, 'loe', 'lol', 'lor', 'run.xml', 'glg', 'glstex'
