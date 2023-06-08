# Nextdoor Nature

This is part of the [Wildlife Trusts](https://www.wildlifetrusts.org/) larger [TeamWilder](https://www.hiwwt.org.uk/team-wilder) projects.

[Current release](https://team-wilder-proto.pages.dev/)

[Current content editor](https://team-wilder-content.netlify.app/admin)

## Development

### Prerequisites

- [elm](http://elm-lang.org/) 0.19
- [node](https://nodejs.org/)
- [nvm for macOS & Linux](https://github.com/nvm-sh/nvm) or [nvm for Windows](https://github.com/coreybutler/nvm-windows)
- After cloning the repo and running `npm i` you will also need to `npm run prepare` to install [husky](https://blog.typicode.com/husky-git-hooks-autoinstall/)

### Formatting

We recommend integrating `elm-format@0.8.6` and `prettier` into your code editor. A pre-commit hook is configured to take care of this if not.

### Build

- `npm run dev` for a hot reload server at [http://localhost:3000](http://localhost:3000)
- `npm run build` to generate a production build in `dist`

### Test

We are using [elm test](https://package.elm-lang.org/packages/elm-explorations/test/latest).
We don't have all the time in the world, so tests will be light.
We aim to cover any exposed API in our modules and things with potential to fail and go unnoticed.

- `npm test` to run `elm-test`

### Linting

You can run [elm-review](https://github.com/jfmengels/elm-review) on your code with the following command.

```sh
npm run lint
```

We use rules provided by [jfmengels/elm-review-config/application](https://github.com/jfmengels/elm-review-config).

Rules live in `review/src/ReviewConfig.elm` and can be modified if needed. These are suggestions to improve code quality but not acceptance criteria.

## Deployment

- When a pull request is created against `main`, cloudflare builds a preview site
- When code is merged into `main` it is deployed to https://team-wilder-proto.pages.dev/

## Using the CMS

- The netlify admin for the site can be accessed at https://team-wilder-content.netlify.app/admin
- To log in you'll need to use your github account and have write permission to this repo to make changes.
- Any changes made & published here will be pushed to main

## Code and configs

### What it's for

- Static code generated with [elm](https://elm-lang.org/docs) and [[cCc]]()
- Deployed and hosted by [Cloudflare](https://www.cloudflare.com/)
- `elm.json` for elm packages
- `package.json` for node scripts and packages
- `package-lock.json` for current versions of node packages
- `src/*` contains app source files

### Content & Pages

- Pages are in `Page/`
- Markdown content is in `content/`
- Markdown content is compiled to `.json` files with `generate` script
- Copy not in `content/` (e.g. UI copy) is in language files like `I18n/En.elm`
- We use `[cCc] to denote placeholder copy`
- We use `[fFf] to denote placeholder UI feature or section`

### Styling & layouts

- We are using [elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for styling

## Development workflow

### Adding issues

- add effort & value labels (if you know enough about it)
- put the issue in a milestone (if it is part of a current epic)

### Working on issue

- assign it to yourself before starting work
- make a branch that includes the issue type (fix/feat/chore etc & number)
- make sure you understand the acceptance criteria
- don't forget to include tests if it's a new feature
- ask questions & make plan

### Code review & merge

- check the acceptance criteria have been met (with tests if appropriate)
- add comments & questions
- once approved, leave for the author to squash and merge

## License

Source code is released under the [Hippocratic License](https://firstdonoharm.dev/version/3/0/license/).
