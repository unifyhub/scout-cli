#!/usr/bin/env bats

# Setup: Create a temporary test directory
setup() {
  # Create a temp directory for isolated tests
  test_dir="./test_env"
  mkdir -p "$test_dir"

  # Move into the test directory
  cd "$test_dir"
}

# Teardown: Remove the temporary test directory after each test
teardown() {
  # Clean up the test directory
  cd ..
  rm -rf "$test_dir"
}

# Test: Check if scout runs with default values (current directory, no extension, no filter)
@test "Scout should run with defaults and find all files in current directory" {
  touch testfile.yaml
  run scout
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "File: ./testfile.yaml") -eq 1 ]
  rm -f testfile.yaml
}

# Test: Check if scout runs with a specified path
@test "Scout should find files in the specified path" {
  mkdir -p ./testdir
  echo "example: value" > ./testdir/testfile.yaml
  run scout -p ./testdir
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "File: ./testdir/testfile.yaml") -eq 1 ]
  rm -rf ./testdir
}

# Test: Check if scout filters by extension
@test "Scout should find files with the specified extension" {
  echo "example: value" > test.json
  run scout -e json
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "File: ./test.json") -eq 1 ]
  rm -f test.json
}

# Test: Check if scout skips files with different extensions
@test "Scout should skip files without the specified extension" {
  echo "example: value" > test.yaml
  run scout -e json
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "File: ./test.yaml") -eq 0 ]
  rm -f test.yaml
}

# Test: Check if scout applies grep filter
@test "Scout should find files containing the specified filter value" {
  echo "unique_value" > testfile.yaml
  run scout -f unique_value
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "unique_value") -eq 1 ]
  rm -f testfile.yaml
}

# Test: Check if scout skips files not containing the filter value
@test "Scout should skip files that do not match the filter value" {
  echo "different_value" > testfile.yaml
  run scout -f unique_value
  [ "$status" -eq 0 ]
  [ $(echo "$output" | grep -c "different_value") -eq 0 ]
  rm -f testfile.yaml
}
