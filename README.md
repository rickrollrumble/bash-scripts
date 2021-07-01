Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

# bash-scripts
make scripts executable by running `chmod +rwx <file-name>.sh`
run all files using bash (or sudo bash) &lt;path-to-script>/&lt;script-name.sh>

## container-backups.sh

gets a list of all running containers, commits those containers in the current state, and backs them up as tar files in a created folder called container-backups.

images are automatically tagged, and tags are generated in the format `month_date_year`. 

So, the entire image is named as `<container-name>:[tag]`. Image version is stored in a file called img-version.txt that is created on first run. Script can be run using a cron job to backup containers on a set interval. 
