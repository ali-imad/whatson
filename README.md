# `whatson`

See what's currently playing on Criterion Channel 24/7.

## Installation
### Homebrew
```bash
brew tap ali-imad/tap
brew install whatson
```

### Manual
```bash
git clone https://github.com/ali-imad/whatson @ali-imad/whatson
cd @ali-imad/whatson
ln -s parse_whatson.sh ~/.local/bin/whatson # or ~/bin/, or /usr/local/bin, or wherever
```

## Usage
```bash
$ whatson           # Show current film + time remaining on Criterion 24/7
The Joke
Next film starts in: 42 minutes

$ whatson -c        # Compact
The Joke - Next film starts in: 42 minutes

$ whatson -t        # Time only
42 minutes

$ whatson -n        # Name only
The Joke
```
