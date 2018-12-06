# EnvironmentHelper.iOS

To build documentation:

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

