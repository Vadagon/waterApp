# Flutter Universal Fitness App

## Flutter core commands
flutter build appbundle
flutter build apk
flutter build ios


## icon and splashscreen commands
flutter pub run flutter_launcher_icons:main
flutter pub pub run flutter_native_splash:create

flutter pub run flutter_launcher_icons:main && flutter pub pub run flutter_native_splash:create

## Permission issue
sudo chmod -R 777 ./

## Git
### clear all commits until the last one on the origin (remote)
git reset --hard origin/splits

### unstage changes of the file of the merge
    git reset -- android/app/src/main/res/drawable-mdpi/splash.png

### unstage and discard changes of the files
<!-- local HEAD -->
git checkout HEAD -- ios/ 

### git clone process
<!-- change to pull of the branch -->
git fetch origin buttocks
git merge origin/buttocks

<!-- change to current the branch -->
git checkout origin/splits ios/  && git checkout origin/splits android/ && git checkout origin/splits lib/config.dart && git checkout origin/splits listing.txt && git checkout origin/splits assets/icon/  && git checkout origin/splits README.md

<!-- change tp pull of the branch -->
rm -r android/app/src/main/kotlin/com/verblike/buttocks/

git add .

### Git speed dial =)

git fetch origin buttocks && git merge origin/buttocks 

git checkout origin/splits ios/  && git checkout origin/splits android/ && git checkout origin/splits lib/config.dart && git checkout origin/splits listing.txt && git checkout origin/splits assets/icon/  && git checkout origin/splits README.md && rm -r android/app/src/main/kotlin/com/verblike/buttocks/ && git add .