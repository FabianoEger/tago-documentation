### Tago Documentation

#### Editing

Every menu entry has a file matching it's name with the .rst extension. So to add or remove documentations just edit those files.

#### Generating the HTML

```bash
$ make html
```

The HTML will be in the `_build/html/` folder. Just open the `index.html` to visualize the documentation.

#### reStructuredText syntax docs

resStructuredText syntax differs from Markdown in many ways, you can use the following docs to support you.

http://sphinx-doc.org/rest.html

http://sphinx-doc.org/markup/index.html

Please note that the titles in each .rst file are responsible for creating the sub menus in the sidebar. To fully understand how this works, I recommend you to read this article before creating your docs: http://sphinx-doc.org/rest.html#sections
