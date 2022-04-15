# DocFX pdf action

This action is a clone of [docfx-action](https://github.com/marketplace/actions/docfx-action) by [Niklas Mollenhauer](https://github.com/nikeee) aiming to give better support for pdf file creation

## Software
- [Dockerimage](https://hub.docker.com/r/vakuware/docfx-pdf-action/tags) version 1.3
  - [DocFX](https://github.com/dotnet/docfx) version 2.59.2
  - [wkhtmltox](https://wkhtmltopdf.org/) version 0.12.6-1

## Usage
```yaml
jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
    - uses: actions/checkout@v1
    # ...
    - name: Build Documentation
      uses: VakuWare/docfx-pdf-action@v1.4.0
      with:
        args: path/to/your/docfx.json
```

In general, to run `docfx <something>`, you can use:
```yaml
    - uses: VakuWare/docfx-pdf-action@v1.4.0
      with:
        args: <something>
```
