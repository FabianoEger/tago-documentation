### Tago Documentation
Check the internal BDD page [HERE](https://github.com/tago-io/tago-documentation/wiki).

#### Commands
``` bash
$ make generator
$ make live doc=account #you can use: account, device, analysis
$ make deploy
```

### Tago Docs (inside the `tago-docs` folder)

Setup a local server

Inside the tago-docs folder run
```bash
$ npm install
$ grunt
```

Create/edit documentation

The daux.io will look for Markdown files (*.md and *.markdown) inside the docs folder and any of the subfolders within docs. To sort your files and folders in a specific way, you can prefix them with a number and underscore, e.g. `/docs/01_Hello_World.md` and `/docs/05_Features.md` This will list Hello World before Features, overriding the default alpha-numeric sorting. The numbers will be stripped out of the navigation and urls. For the file 6 Ways to Get Rich, you can use `/docs/_6_Ways_to_Get_Rich.md`.

You might also wish to stick certain links to the bottom of a page. You can do so by appending a '-' to the start of the filename, e.g. a new file `/docs/-Contact_Us.md` will always appear at the bottom of the current list. Weights can also be added to further sort the bottom entries. e.g. `/docs/-01_Coming.md` will appear before `/docs/-02_Soon.md` but both will only appear after all positive or non-weighted files.
