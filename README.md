<p align="center"><img src="https://cdn.svarun.dev/gh/actions-small.png" width="150px"/></p>

# WordPress Pot Generator - ***Github Action***
This Action Generates POT Files for your wordpress Plugin / Theme based on the content inside Github Repo

## ⚙️ Configuration
| Key | Default | Description |
| --- | ------- | ----------- |
| `SAVE_PATH` | ./ | Location / Path to save POT File **Required** |
| `ITEM_SLUG` | NULL | Slug of your WordPress Theme / Plugin Slug  **Required** |
| `DOMAIN` | NULL | WordPress Theme / Plugin ***TextDomain*** |
| `PACKAGE_NAME` | NULL | WordPress Theme / Plugin Name |
| `HEADERS`  | NULL | Array in JSON format of custom headers which will be added to the POT file. Defaults to empty array. |
| `GITHUB_TOKEN` | **secret** | you do not need to generate one but you do have to explicitly make it available to the Action |

> **⚠️ Note:** You Should Provide Github Token. If Not Updated File Will Be Committed & Pushed.

## 🚀  Example Workflow File
<!-- START RAW -->
```yaml
name: On Push

on:
  push:
    branches:
      - master

jobs:
  WP_POT_Generator:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: WordPress POT Generator
      uses: varunsridharan/action-wp-pot-generator@2.0
      with:
        save_path: './i8n'
        item_slug: 'wponion'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
<!-- END RAW -->

---

<!-- START common-footer.mustache -->
<!-- END common-footer.mustache -->