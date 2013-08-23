# Guard Stitch Plus

A guard compiling and uglifying javascripts, powered by [stitch-plus](https://github.com/imathis/stitch-plus).

## Installation

Add this line to your application's Gemfile:

    gem 'guard-stitch-plus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-stitch-plus

## Usage

Add this guard to your Guardfile with `guard init stitch-plus`. Here's a sample Guardfile.

```ruby
stitch_config = {
  output: 'javascripts/site.js',
  dependencies: [
    'javascripts/lib/jquery.js',
    'javascripts/lib'
  ],
  paths: ['javascripts/modules'],
  fingerprint: true,
  uglify: true
}

guard 'stitch-plus', stitch_config do
  watch /^javascripts/
end
```

Whenever the guard is loaded or when a javascript file changes which is being watched, stitch-plus will:

1. Add jquery.js, followed by any other javascript or coffeescript file in `javascripts/lib/`.
2. Add a Require function and wrap all files in `javascripts/modules` in a CommonJS wrapper.
3. Uglify the compiled javascript.
4. Write it to a fingerprinted file at `javascripts/site-f1408932717b4b16eb97969d34961213.js`.

### Using this with Jekyll?

If you're using Jekyll, be sure to check out [jekyll-stitch-plus](https://github.com/octopress/jekyll-stitch-plus) which integrates smoothly with jekyll and also plays
nicely with this guard plugin. In that case be sure to add your stitch-plus configuration to your Jekyll config file (usually _config.yml) and point your guard to that
file as well.

Your Jekyll YAML config file might look like this.

```yaml
stitch:
  output: 'javascripts/site.js'
  dependencies: 
    - 'javascripts/lib/jquery.js'
    - 'javascripts/lib'
  paths: ['javascripts/modules']
  fingerprint: true
  uglify: true
```

Then your Guardfile would look like this.

```ruby
guard 'stitch-plus', config: '_config.yml' do
  watch /^(javascripts|_config.yml)/
end
```

Notice that the guard is also watching the Jekyll config file.

## Configuration

Configure stitch-plus by passing a hash of options or pointing it to a YAML config file. 

| Config           | Description                                                                | Default     |
|:-----------------|:---------------------------------------------------------------------------|:------------|
| `config`         | A path to a YAML file containing stitch configurations                     | nil         |
| `dependencies`   | Array of files/directories to be added first as global javascripts         | nil         |
| `paths`          | Array of directories where javascripts will be wrapped as CommonJS modules | nil         |
| `output`         | A path to write the compiled javascript                                    | 'all.js'    |
| `fingerprint`    | Add a fingerprint to the file name for super cache busting power           | false       |
| `cleanup`        | Automatically remove previously compiled files                             | true        |
| `uglify`         | Smash javascript using the Uglifier gem                                    | false       |
| `uglify_options` | Options for the Uglifier gem. See the [Uglifier docs](https://github.com/lautis/uglifier#usage) for details. | {}       |

Note: You can configure from the hash and a yaml file, but configurations loaded from a YAML file will override any settings in your config hash. For example, `{config: 'stitch.yml', uglify: false}` will be overwritten if the yaml file sets `uglify: true`.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 Brandon Mathis

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

