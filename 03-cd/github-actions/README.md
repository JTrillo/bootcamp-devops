# GitHub Actions

## Workflow file structure
```yml
name: Workflow descriptive name

on:
  push: # Could also be 'pull_request', 'page_build' or 'release'
    branches: [main]

env:
  COUNTRY: Spain

jobs:
  job1:
    strategy:
      # A job matrix can generate a maximum of 256 jobs per workflow run
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        node: [6, 8, 10]
        exclude:
        - os: windows-latest
          node: 6
        include: # All 'include' combinations are processed after 'exclude'
        - os: macos-latest
          node: 13
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node }}
      - name: Print node version
        run: node --version
  
  job2:
    runs-on: ubuntu-20.04
    needs: [job1] # Array of jobs that must be executed before this one
    steps:
      - name: Print my country
        run: echo "I was born in $COUNTRY"
```

## Custom Actions
Each subfolder of this directory contains an example of each type of custom action.

* Docker container actions create a more consistent and reliable unit of work because the consumer of the action does not need to worry about the tools or dependencies. However, it can only be executed on Linux.
* JavaScript actions can be executed on every OS GitHub Actions provides (Linux, macOS, Windows).
* It is possible to personalize and distinguish your custom action through a badge, using a color and a Father icon. Badges are shown next to your action name in Github Marketplace.

### Links
[Available environments](https://github.com/actions/virtual-environments#available-environments)

[Lemoncoders YouTube webinar](https://www.youtube.com/watch?v=Rfe4aNNIoBo)

[Feather icons](https://feathericons.com/)