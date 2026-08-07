> This Plugin / Repo is being maintained by a community of developers.
There is no warranty given or bug fixing guarantee; especially not by
Programmfabrik GmbH. Please use the github issue tracking to report bugs
and self organize bug fixing. Feel free to directly contact the committing
developers.

# commons-library-plugin

This plugin provides shared functions for the custom data type plugins. It does nothing on its
own and needs no configuration — it only has to be installed for the plugins that build on it.

Twelve plugins declare it as a dependency, so fylr installs it with them automatically:
`custom-data-type-cerlthesaurus`, `custom-data-type-dante`, `custom-data-type-geonames`,
`custom-data-type-georef`, `custom-data-type-getty`, `custom-data-type-gn250`,
`custom-data-type-gnd`, `custom-data-type-goobi`, `custom-data-type-gvk`,
`custom-data-type-iconclass`, `custom-data-type-nomisma` and `custom-data-type-tnadiscovery`.

## installation

The latest version of this plugin can be found [here](https://github.com/programmfabrik/fylr-plugin-commons-library/releases/latest/download/fylr-plugin-commons-library.zip).

The ZIP can be downloaded and installed using the plugin manager, or used directly (recommended).

Github has an overview page to get a list of [all releases](https://github.com/programmfabrik/fylr-plugin-commons-library/releases/).

## configuration

No configuration yet.

## csv-importer-support

CustomDataTypePlugins build with this library automatically support the csv-importer-field-value in the following ways:

1. JSON object 
~~~ 
    {
      "conceptName": "Erbsen",
      "conceptURI": "http://vocab.getty.edu/tgn/7188765",
      ...
      ..
    }
    here conceptURI is mandatory, everything else optional
~~~ 
2. only URI as string
3. combination of Name and URI in the format "Name@$@URI"

Ensure to use the plugin-update-mechanism after the csv-import to complete the fieldinformation.

## sources

The source code of this plugin is managed in a git repository at <https://github.com/programmfabrik/fylr-plugin-commons-library>.
