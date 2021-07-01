# bash-scripts
make scripts executable by running `chmod +rwx <file-name>.sh`
run all files using bash (or sudo bash) &lt;path-to-script>/&lt;script-name.sh>

## container-backups.sh

gets a list of all running containers, commits those containers in the current state, and backs them up as tar files in a created folder called container-backups.

images are automatically tagged, and tags are generated in the format `month_date_year`. 

So, the entire image is named as `<image-name>:[tag]`
