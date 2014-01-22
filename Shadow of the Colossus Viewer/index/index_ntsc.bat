set drive=%1

for %%f in  (nico.dat nico.dat nico.dat) do type %%f.index 2>nul >nul || python index-win.py %drive%\%%f > %%f.index
for %%f in  (nico.dat nico.dat nico.dat) do ocaml index.ml index %drive%\%%f < %%f.index 
