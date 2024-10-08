# Scout CLI Utility

Scout is a command-line utility designed to recursively search through a Git repository, identify specific file formats, and optionally filter their content based on keywords. It provides a convenient way to navigate large repositories and extract meaningful content in a clean and visually distinct format.

## Features
- **Search Specific File Types**: Recursively find files with specified extensions.
- **Grep Filtering**: Filter content based on a keyword to display only matching lines.
- **Partial File Output**: Display only parts of a file (5 lines above and below the match) for more context.
- **Ignore Certain Directories**: Skip `.git`, `.idea`, or other specified directories to focus on relevant content.
- **Color-coded Output**: Uses colors to differentiate between file paths and their content for easy visual scanning.

## Requirements
- Must be run inside a Git repository.
- `bats-core` installed for running tests.

## Installation
### Install via GitHub
To install Scout directly from the GitHub repository, run:

```bash
curl -sSL https://raw.githubusercontent.com/unifyhub/scout-cli/main/install.sh | bash
```

### Install via Homebrew
You can also install Scout via Homebrew:

```bash
brew tap unifyhub/scout-cli
brew install scout
```

## Usage
Scout provides various options to search and filter files:

```bash
scout [options]
```

### Options
- `-p <path>`: Specifies the path to start the search. Defaults to the current directory if no path is provided.
- `-e <extension>`: Filters files by their extension (e.g., `yaml`, `json`). If no extension is specified, all files are processed.
- `-f <filter>`: Filters file content using `grep`. Only files containing the specified keyword are displayed.
- `-l <limit>`: Limits the output to partial file content. Shows 5 lines before and after the matched keyword. Default is `none`, meaning the entire file will be displayed.

### Examples
- **Find all YAML files in the current directory**:
  ```bash
  scout -e yaml
  ```
- **Search for a specific keyword in JSON files**:
  ```bash
  scout -e json -f "unique_value"
  ```
- **Limit output to 5 lines above and below the match**:
  ```bash
  scout -f "keyword" -l 5
  ```

## Running Tests
Scout comes with unit tests written in `bats`. To run the tests locally:

1. Ensure `bats-core` is installed:
   ```bash
   brew install bats-core
   ```

2. Run the tests:
   ```bash
   bats tests/scout_tests_updated.bats
   ```

## Contributing
Feel free to contribute to Scout by opening a pull request or submitting issues on GitHub.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

