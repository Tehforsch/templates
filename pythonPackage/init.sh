projectName=$1
mv pythonPackage $projectName
for f in $(find . -name "*.py"); do
    sed -i "s/pythonPackage/$projectName/g" $f
done
