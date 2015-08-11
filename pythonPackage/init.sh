projectName=$1
for f in $(find . -name "*.py"); do
    sed -i "s/pythonPackage/$projectName/g" $f
done
