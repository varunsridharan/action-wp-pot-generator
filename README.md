# WordPress Pot Generator - ***Github Action***
This Action Generates POT Files for your wordpress Plugin / Theme based on the content inside Github Repo

## Configuration
| Key | Default | Description |
| --- | ------- | ----------- |
| `SAVE_PATH` | ./ | Location / Path to save POT File **Required** |
| `ITEM_SLUG` | NULL | Slug of your WordPress Theme / Plugin Slug  **Required** |
| `DOMAIN` | NULL | WordPress Theme / Plugin ***TextDomain*** |
| `PACKAGE_NAME` | NULL | WordPress Theme / Plugin Name |
| `HEADERS`  | NULL | Array in JSON format of custom headers which will be added to the POT file. Defaults to empty array. |
| `GITHUB_TOKEN` | **secret** | you do not need to generate one but you do have to explicitly make it available to the Action |

> **⚠️ Note:** You Should Provide Github Token. If Not Updated File Will Be Committed & Pushed.

## Example Workflow File
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
      uses: varunsridharan/action-wp-pot-generator@1.1
      with:
        save_path: './i8n'
        item_slug: 'wponion'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

---
## Contribute
If you would like to help, please take a look at the list of
[issues][issues] or the [To Do](#-todo) checklist.

## License
Our GitHub Actions are available for use and remix under the MIT license.

## Copyright
2017 - 2018 Varun Sridharan, [varunsridharan.in][website]

If you find it useful, let me know :wink:

You can contact me on [Twitter][twitter] or through my [email][email].

## Backed By
| [![DigitalOcean][do-image]][do-ref] | [![JetBrains][jb-image]][jb-ref] |  [![Tidio Chat][tidio-image]][tidio-ref] |
| --- | --- | --- |

[twitter]: https://twitter.com/varunsridharan2
[email]: mailto:varunsridharan23@gmail.com
[website]: https://varunsridharan.in
[issues]: issues/

[do-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/DO_Logo_Horizontal_Blue-small.png
[jb-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/phpstorm-small.png?v3
[tidio-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/tidiochat-small.png
[do-ref]: https://s.svarun.in/Ef
[jb-ref]: https://www.jetbrains.com
[tidio-ref]: https://tidiochat.com

