# Nextdoor Nature

This is part of the [Wildlife Trusts](https://www.wildlifetrusts.org/) larger [TeamWilder](https://www.hiwwt.org.uk/team-wilder) projects.

[![Netlify Status](https://api.netlify.com/api/v1/badges/383058cb-d638-4810-ba58-38139d1fdde0/deploy-status)](https://app.netlify.com/sites/team-wilder-content/deploys)

[Release https://nextdoornaturehub.org.uk](https://nextdoornaturehub.org.uk/)

[Current content editor](https://team-wilder-content.netlify.app/admin)

## Development

### Prerequisites

- [elm](http://elm-lang.org/) 0.19
- [node](https://nodejs.org/)
- [nvm for macOS & Linux](https://github.com/nvm-sh/nvm) or [nvm for Windows](https://github.com/coreybutler/nvm-windows)
- After cloning the repo and running `npm install` you will also need to `npm run prepare` to install [husky](https://blog.typicode.com/husky-git-hooks-autoinstall/)
- [Image Magick](https://imagemagick.org/index.php) (for image size fixing)

### Formatting

We recommend integrating `elm-format@0.8.6` and `prettier` into your code editor. A pre-commit hook is configured to take care of this if not.

### Build

- `npm run dev` for a hot reload server which defaults to [http://localhost:5173](http://localhost:5173)
- `npm run build` to generate a production build in `dist`

### Test

We are using [elm test](https://package.elm-lang.org/packages/elm-explorations/test/latest).
We don't have all the time in the world, so tests will be light.
We aim to cover any exposed API in our modules and things with potential to fail and go unnoticed.

- `npm test` to run `elm-test`

### Linting

You can run [elm-review](https://github.com/jfmengels/elm-review) on your code with `npm run lint`

We use rules provided by [jfmengels/elm-review-config/application](https://github.com/jfmengels/elm-review-config) to improve code quality.

Rules live in `review/src/ReviewConfig.elm` and can be modified if needed.

## Deployment

- When a pull request is created against `main`, cloudflare builds a preview site
- When code is merged into `main` it is deployed to https://team-wilder-proto.pages.dev/

## Editing content

- The CMS can be accessed at https://team-wilder-content.netlify.app/admin
- To log in you'll need to use your github account and have write permission to this repo to make changes.
- Any changes drafted will generate a preview site which can be accessed by opening the [pull request linked to the change](https://github.com/geeksforsocialchange/teamwilder/pulls)
- Any changes marked ready and then published will be released to the public site at https://nextdoornaturehub.org.uk

## Code and configs

### What it's for

#### Project configuration

- `elm.json` for elm packages
- `package.json` for node scripts and packages
- `package-lock.json` for current versions of node packages
- `src/*` contains app source files
- `./formstackTheme.css` styles our formstack iframe, it can be applied by following these [instructions](https://help.formstack.com/s/article/Custom-Form-Themes-and-CSS)
- `netlify.toml` for [Netlify deploy configuration](https://docs.netlify.com/configure-builds/file-based-configuration/)

#### Content & Pages

- Pages are in `Page/`
- Assets to be copied to deploy bundle root are in `public/`
- Markdown content is in `content/`
- Markdown content is compiled to `.json` files with `generate` script
- Copy not in `content/` (e.g. UI copy) is in language files like `I18n/En.elm`
- We use `[cCc] to denote placeholder copy`

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

### Bulk image resizing

There is no hard limit on image size that can be uploaded. We want to keep
this reasonable to make loading time as fast as possible for end users. So
to bulk resize all images greater than '2000x2000' run:

```
mogrify -resize '2000x2000>' ./public/images/uploads/*.jpg
```

## License

Source code is released under the [Hippocratic License](https://firstdonoharm.dev/version/3/0/license/).
