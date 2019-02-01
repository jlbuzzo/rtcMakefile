# NAME

rtcMakefile - A custom pipeline to search for retrocopies in genomes.

# VERSION

version 0.1 (*latest*)

# SYNOPSIS

    $ source laucher.sh input.txt output_dir/

# DESCRIPTION

rtcMakefile aims to search for retrocopies in genomes or groups of genomes
by mining its BAM files for abnormal alignments.

# INSTALLATION

Just clone the [GitHub repository](https://github.com/jlbuzzo/rtcMakefile) from
the command line:

	$ git clone https://github.com/jlbuzzo/rtcMakefile.git

## PREREQUISITES

In order to properly run this pipeline, the user will need these programs
installed:

* GNU make
* gawk
* Perl (5.26.2 or above)

# USAGE

Launching this pipeline is very straightforward. User needs to list all target
BAM files in a plain txt file with their absolute paths in the system
(e.g., `inputs.txt`). So, this:
	$ source launcher.sh inputs.txt output_dir/
will save all the results for the files listed in the input file in the
`outputs_dir` directory.

**NOTE 1:** Before launch the processes, user **must** edit the `opt.mk` configuration
file to adjust its behavior to his system's context.

**NOTE 2:** The final part of this pipeline is **very** memory expensive!

# ACKNOWLEDGMENTS

- Coordination for the Improvement of Higher Level Personnel - [CAPES](http://www.capes.gov.br/)
- Teaching and Research Institute from Sírio-Libanês Hospital - [Group of Bioinformatics](https://www.bioinfo.mochsl.org.br/)

# AUTHORS

- Fabio Navarro <fnavarro@mochsl.org.br>
- Thiago L. A. Miller <tmiller@mochsl.org.br>
- J. Leonel Buzzo <lbuzzo@mochsl.org.br>
- Gabriela Guardia <gguardia@mochsl.org.br>
- Fernanda Orpinelli <forpinelli@mochsl.org.br>
- Pedro A. F. Galante <pgalante@mochsl.org.br>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Teaching and Research Institute from Sírio-Libanês Hospital.

This is free software, licensed under:

	The GNU General Public License, Version 3, June 2007
