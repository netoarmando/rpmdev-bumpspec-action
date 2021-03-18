# Bump rpm specfile action

This action runs `rpmdev-bumpspec`

```bash
$ rpmdev-bumpspec [OPTION]... SPECFILE...
```

## Inputs

### `comment`

```
rpmdev-bumpspec -c COMMENT, --comment=COMMENT
    changelog comment (default: "- rebuilt")
```

### `userstring`

```
rpmdev-bumpspec -u USERSTRING, --userstring=USERSTRING
    user name+email string (default: output from rpmdev-packager(1))
```

### `new`

```
rpmdev-bumpspec -n NEW, --new=NEW
    set new version and reset/set release (simple spec files only)
```

### `specfile`

**Required** Specfile to be bumped.

```
rpmdev-bumpspec SPECFILE...
```

## Example usage

```yaml
on: [workflow_dispatch]

jobs:
  bump_spec_file:
    runs-on: ubuntu-latest
    name: Bump RPM Specfile
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Export variables for rpmdev-bumpspec action
        run: |
            echo "NEW_VERSION=1.0.0dev" >> $GITHUB_ENV
      - name: Run rpmdev-bumpspec action
        uses: netoarmando/rpmdev-bumpspec-action@v1
        id: rpmdev-bumpspec
        with:
          specfile: 'mrack.spec'
          new: ${{ env.NEW_VERSION }}
          userstring: "${{ github.actor }} <${{ github.actor }}@users.noreply.github.com>"
          # comment: 'New vesion'
      - name: Print Specfile
        run: cat mrack.spec
```
