# EnvironmentHelper.iOS

## To build documentation:

```
cd path_to_your_repo/EnvironmentHelper/

jazzy \
--clean \
--author Actonica \
--author_url http://actonica.ru \
--github_url https://github.com/actonica \
--module-version 1.0 \
--xcodebuild-arguments -scheme,EnvironmentHelper \
--module EnvironmentHelper \
--output ../docs/ \
```

## Before preparing a release version run:

```

/usr/libexec/PlistBuddy path_to/Settings.bundle/Root.plist -c "Clear"
/usr/libexec/PlistBuddy path_to/Services.plist -c "Clear"

```
this way you will clear all the info about environments and environment helper will return indefinite result. it must be handled in your app 
