# TransmissionAgent

This agent interfaces with Transmission to manage torrents. At this time it only adds torrents.

## Installation

Add this string to your Huginn's .env `ADDITIONAL_GEMS` configuration:

```ruby
huginn_transmission_agent
# when only using this agent gem it should look like hits:
ADDITIONAL_GEMS=huginn_transmission_agent
```

And then execute:

    $ bundle

## Usage

Incoming events accept the following keys:

Required:
	url: The URL of the torrent file, or magnet link data.

Optional:
	paused: true/false, Should the torrent start paused or now
        download-dir: destination directory for the torrent data
        bandwidthPriority: integer, the priority to add the torrent with


## Development

Running `rake` will clone and set up Huginn in `spec/huginn` to run the specs of the Gem in Huginn as if they would be build-in Agents. The desired Huginn repository and branch can be modified in the `Rakefile`:

```ruby
HuginnAgent.load_tasks(branch: '<your branch>', remote: 'https://github.com/<github user>/huginn.git')
```

Make sure to delete the `spec/huginn` directory and re-run `rake` after changing the `remote` to update the Huginn source code.

After the setup is done `rake spec` will only run the tests, without cloning the Huginn source again.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/huginn_transmission_agent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Acknowledgements

Thanks for @fguillen for the [TransmissionApi](fguillen/TransmissionApi) gem which is bundled in here while there are some dependency issues preventing me from using it as a dependency
