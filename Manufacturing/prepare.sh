#!/bin/bash

projdir="$(basename $(dirname `pwd`))"
echo $projdir
rm $projdir.zip

orgname=(B.Cu B.Mask B.SilkS F.Cu F.Mask F.SilkS Edge.Cuts)
newname=(gbl gbs gbo gtl gts gto gml)

for item in ${!orgname[*]}
do 
	file=$(echo *-${orgname[$item]}.gbr)
	r=$(echo -${orgname[$item]}.gbr)
	n=$(echo .${newname[$item]})
	file2=${file/$r/$n}
	cp  $file $file2
done

drl=$(echo *.drl)
drl=${drl/.drl/}

cp $drl.drl $drl.txt

zip -m $projdir.zip $projdir.gb? $projdir.gt? $projdir.gm? $projdir.txt

rm -rf dirtypcb
mkdir dirtypcb
cd dirtypcb
unzip ../$projdir.zip
