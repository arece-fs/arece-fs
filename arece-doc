rosdoc2 build --package-path $1
rm -rf cross_reference/ docs_build/
mkdir docs
IFS='/' read -ra ADDR <<< $(pwd)
package="${ADDR[-1]}";
mv docs_output/$package/* docs/
rm -rf docs_output/
