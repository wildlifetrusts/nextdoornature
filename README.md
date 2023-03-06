# Team Wilder

[![Build Status]([cCc])

[Current release]([cCc])


## Development

### Prerequisites
- [elm](http://elm-lang.org/) 0.19
- [node](https://nodejs.org/)
- [nvm for macOS & Linux](https://github.com/nvm-sh/nvm) or [nvm for Windows](https://github.com/coreybutler/nvm-windows)

### Formatting
We recommend integrating `elm-format@0.8.3` into your code editor, but if you don't...
- Please `npm run format` to format `.elm` files in `src` before committing code.

### Build
- `npm start` for a hot reload server at [http://localhost:3000](http://localhost:3000)
- `npm run build` to generate a production build in `dist`

### Test
We are using [elm test](https://package.elm-lang.org/packages/elm-explorations/test/latest).
We don't have all the time in the world, so tests will be light.
We aim to cover any exposed API in our modules and things with potential to fail and go unnoticed.
- `npm test` to run `elm-test`


## Deployment

- When a pull request is created against `main`, [cCc] builds a preview site
- When code is merged into `main` it is deployed to [current release]([cCc])


## Code and configs

### What it's for
- Static code generated with [elm](https://elm-lang.org/docs) and [cCc]()
- Deployed and hosted by [Cloudflare](https://www.cloudflare.com/)
- `elm.json` for elm packages
- `package.json` for node scripts and packages
- `package-lock.json` for current versions of node packages
- `[cCc]` for build config
- `[cCc]` for deploy config
- `src/*` contains app source files

### Content & Pages

- Pages are in `Page/`
- Markdown content is in `content/`
- Copy not in `content/` (e.g. UI copy) is in `Copy/Text.elm`
- We use `[cCc] to denote placeholder copy`
- We use `[fFf] to denote placeholder UI feature or section`

### Styling & layouts

- We are using [elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for styling


## Development workflow

### Adding issues

-  add effort & value labels (if you know enough about it)
-  put the issue in a milestone (if it is part of a current epic)

### Working on issue

-  assign it to yourself before starting work
-  make a branch that includes the issue type (fix/feat/chore etc & number)
-  make sure you understand the acceptance criteria
-  don't forget to include tests if it's a new feature
-  ask questions & make plan

### Code review & merge

-  check the acceptance criteria have been met (with tests if appropriate)
-  add comments & questions
-  once approved, leave for the author to squash and merge

## License

Source code is released under the [Hippocratic License](https://firstdonoharm.dev/version/3/0/license/).

