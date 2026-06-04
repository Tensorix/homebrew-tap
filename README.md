# Tensorix Homebrew Tap

Homebrew formula & cask for [Metahub](https://github.com/Tensorix/metahub-core).

```sh
brew tap tensorix/tap

# CLI — the `mh` command
brew install tensorix/tap/metahub-cli

# Desktop app
brew install --cask tensorix/tap/metahub-app
```

The app is unsigned (open-source, no Apple signing). Installed via Homebrew it is
not quarantined like a browser download; if macOS Gatekeeper still blocks it, use:

```sh
brew install --cask --no-quarantine tensorix/tap/metahub-app
```

`Formula/metahub-cli.rb` and `Casks/metahub-app.rb` are regenerated automatically
by CI on each Metahub release.
