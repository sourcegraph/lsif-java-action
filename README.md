# Sourcegraph Java LSIF Indexer GitHub Action

This action generate LSIF data from Java source code. See the [LSIF Java indexer](https://github.com/sourcegraph/lsif-java) for more details.

## Usage

The following inputs can be set.

| name         | default   | description |
| ------------ | --------- | ----------- |
| file         | dump.lsif | The output file (relative to the repository root). |
| project_root | `.`       | The root of the repository. |

The following is a complete example that uses the [upload action](https://github.com/sourcegraph/lsif-upload-action) to upload the generated data to [sourcegraph.com](https://sourcegraph.com). Put this in `.github/workflows/lsif.yaml`.

```
name: LSIF
on: [push, pull_request]
jobs:
  build:
    name: Build and push LSIF data
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Generate LSIF data
        uses: sourcegraph/lsif-java-action@master
        with:
          verbose: true
      - name: Upload LSIF data
        uses: sourcegraph/lsif-upload-action@master
        with:
          endpoint: https://sourcegraph.com
          github_token: ${{ secrets.GITHUB_TOKEN }}
          file: dump.lsif
```
