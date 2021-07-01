if [ -f "img-version.txt" ]; then
        echo "Version file exists"
        read version < img-version.txt
        echo "Current version number: $version"
else
        echo "Version file not found, Please enter a one-time initial image version number:"
        read init_version
        echo "Thank you, version stored."
        echo "$init_version" > img-version.txt
fi

day=$(date +"%d")
month=$(date +"%m")
year=$(date +"%Y")
new_version="${month}_${day}_${year}"

mkdir -pv container-backups
cd container-backups

tt=( $(sudo docker ps --format "{{.Names}}") )

for i in "${tt[@]}"
do
        sudo docker rmi ${i/%/:${version}} || true
        sudo rm ${i/%/_${version}}.tar || true
        sudo docker commit ${i} ${i/%/:${new_version}}
        sudo docker save ${i/%/:${new_version}} > ${i/%/_${new_version}}.tar
done
echo "$new_version" >  ../img-version.txt
cd ..
