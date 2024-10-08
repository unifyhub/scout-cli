#!/bin/bash

# Clone the repo
git clone https://github.com/unifyhub/scout-cli.git

# Move the binary to a location in the PATH
sudo mv scout-cli/bin/scout /usr/local/bin/scout

# Make it executable
sudo chmod +x /usr/local/bin/scout

# Clean up by removing the downloaded repository
rm -rf scout-cli

echo "Scout CLI has been installed successfully!"
