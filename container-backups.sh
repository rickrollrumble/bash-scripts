version="6_30_2021"
day=$(date +"%d")
month=$(date +"%m")
year=$(date +"%Y")
new_version="${month}_${day}_${year}"

mkdir container-backups
cd container-backups

tt=( $(sudo docker ps --format "{{.Names}}") )
for i in "${tt[@]}"
do
	sudo docker rmi ${i/%/:${version}} || true
	sudo docker commit ${i} ${i/%/:${new_version}}
	sudo docker save ${i/%/:${new_version}} > ${i}.tar
done
version=$new_version
echo "version = $version"
