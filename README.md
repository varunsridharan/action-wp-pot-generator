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
## 📝 Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[Checkout CHANGELOG.md](https://github.com/varunsridharan/action-wp-pot-generator/blob/main/CHANGELOG.md)


## 🤝 Contributing
If you would like to help, please take a look at the list of [issues](https://github.com/varunsridharan/action-wp-pot-generator/issues/).


## 📜  License & Conduct
- [**MIT License**](https://github.com/varunsridharan/action-wp-pot-generator/blob/main/LICENSE) © [Varun Sridharan](website)
- [Code of Conduct](https://github.com/varunsridharan/.github/blob/master/CODE_OF_CONDUCT.md)


## 📣 Feedback
- ⭐ This repository if this project helped you! :wink:
- Create An [🔧 Issue](https://github.com/varunsridharan/action-wp-pot-generator/issues/) if you need help / found a bug


## 💰 Sponsor
[I][twitter] fell in love with open-source in 2013 and there has been no looking back since! You can read more about me [here][website].
If you, or your company, use any of my projects or like what I’m doing, kindly consider backing me. I'm in this for the long run.

- ☕ How about we get to know each other over coffee? Buy me a cup for just [**$9.99**][buymeacoffee]
- ☕️☕️ How about buying me just 2 cups of coffee each month? You can do that for as little as [**$9.99**][buymeacoffee]
- 🔰         We love bettering open-source projects. Support 1-hour of open-source maintenance for [**$24.99 one-time?**][paypal]
- 🚀         Love open-source tools? Me too! How about supporting one hour of open-source development for just [**$49.99 one-time ?**][paypal]

<!-- Personl Links -->
[paypal]: https://sva.onl/paypal
[buymeacoffee]: https://sva.onl/buymeacoffee
[twitter]: https://sva.onl/twitter/
[website]: https://sva.onl/website/


## Connect & Say 👋
- **Follow** me on [👨‍💻 Github][github] and stay updated on free and open-source software
- **Follow** me on [🐦 Twitter][twitter] to get updates on my latest open source projects
- **Message** me on [📠 Telegram][telegram]
- **Follow** my pet on [Instagram][sofythelabrador] for some _dog-tastic_ updates!

<!-- Personl Links -->
[sofythelabrador]: https://www.instagram.com/sofythelabrador/
[github]: https://sva.onl/github/
[twitter]: https://sva.onl/twitter/
[telegram]: https://sva.onl/telegram/


---

<p align="center">
<i>Built With ♥ By <a href="https://sva.onl/twitter"  target="_blank" rel="noopener noreferrer">Varun Sridharan</a> <a href="https://en.wikipedia.org/wiki/India">
   <img src="https://cdn.svarun.dev/flag-india.jpg" width="20px"/></a> </i> <br/><br/>
   <img src="https://cdn.svarun.dev/codeispoetry.png"/>
</p>

---


<!-- END common-footer.mustache -->