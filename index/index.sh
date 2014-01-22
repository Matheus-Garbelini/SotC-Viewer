path=$1

for file in NICO.DAT XAB XAC XAD XAE; do
    test -f $file.index || python index.py $path/$file > $file.index
    ocaml index.ml index $path/$file <$file.index
done
