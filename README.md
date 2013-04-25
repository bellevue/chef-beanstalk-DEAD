Chef cookbook for managing beanstalk queueing engine 

### Supported Platforms
- CentOS 6.3
- Ubuntu 12.04.1

NOTE: May work with other versions of the above. Just has not been tested. 

## Attributes

### install_type

Determines whether to do a source or package install.

Default `package`

## Recipes

### default

Default recipe is simply a wrapper for either source or package.  It will verify that the platform is supported and will require another recipe depending on the installation type.

### source

Installs build tools and compiles from source.

## License

This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).
