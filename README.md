# my-git-templates

This repository stores the git templates I use (primarily hooks/pre-commit) and allows me to use these templates as the default for all new repositories on my local machines.

It uses symbolic links to make sure editing the pre-commit (or other template) in one repository affects all other repositories, too.

# Symbolic links

Here is the general layout:
 - `~/.git-templates => $REPO/links`
 - `$REPO/links/templateDir => $REPO/templates`
 - `$REPO/links/<templateFolder>/<template> => ../templateDir/<templateFolder>/<template>`
