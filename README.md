# DEPRECATED: Sourcegraph Java LSIF Indexer GitHub Action

This action is no longer needed. It's recommended to use the action
`coursier/setup-action` to install `lsif-java` directly instead.

The
[sourcegraph/sbt-sourcegraph](https://github.com/sourcegraph/sbt-sourcegraph/blob/main/.github/workflows/sourcegraph.yml)
repository has a self-contained example for how to run `lsif-java` with GitHub
Actions.

See the [lsif-java](https://sourcegraph.github.io/lsif-java) documentation for
more detailed instructions on how to use `lsif-java`.

A workflow file using `coursier/setup-action` to install `lsif-java` could like
this:

```diff
  // .github/workflows/lsif.yaml
  name: LSIF
  on: [push, pull_request]
  jobs:
    build:
      name: Build and push LSIF data
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2
+       - name: Install lsif-java
+         uses: coursier/setup-action@v1.1.2
+         with:
+           apps: lsif-java
        - name: Generate LSIF data
+         run: lsif-java index
-         uses: sourcegraph/lsif-java-action@master
-         with:
-           verbose: true
        - name: Upload LSIF data
          uses: sourcegraph/lsif-upload-action@master
          with:
            endpoint: https://sourcegraph.com
            github_token: ${{ secrets.GITHUB_TOKEN }}
            file: dump.lsif
```

See the [coursier/setup-action](https://github.com/coursier/setup-action)
repository for more details on how to use `coursier/setup-action`.
