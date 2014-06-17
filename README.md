#Visual PDF Diff

Merges two PDF files into one PDF file and highlights their visual differences.

##Usage
Give two PDF files as arguments and wait (it may take a few minutes depending on size of files).
```
./visualpdfdiff.sh left.pdf right.pdf
```
It creates **visual-pdf-diff-result.pdf** file in the current folder.
Intermediary files are saved in `/tmp/visual-pdf-diff/` folder.

##Dependencies
Following applications are required:
  1. _bash_, _gawk_, and _cut_ for scripting,
  2. _convert_ for converting PDF files to images and reassembling them again,
  3. _composite_ for overlaying images of pages.

You can find them in the **imagemagick** package (the actual package name is distribution-dependent).

##License
    Copyright © 2014  Behnam Momeni

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see {http://www.gnu.org/licenses/}.
