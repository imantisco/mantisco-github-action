# Pull Reqeust Generator

[![PR Generator Test](https://github.com/imantisco/mantisco-github-action/actions/workflows/pull_reqeust_generator_test.yaml/badge.svg)](https://github.com/imantisco/mantisco-github-action/actions/workflows/pull_reqeust_generator_test.yaml)

PR Generator를 사용해서 자동으로 PR을 생성할 수 있습니다.

## Get Started

```yaml
name: PR Generator Test

on:
  push:
    branches:
      - 'ci/*'
      - 'ci/*/*'
      - 'feat/*'
      - 'fix/*'
      - 'hot-fix/*'

jobs:
  test:
    runs-on: ubuntu-22.04
        
    steps:
      - uses: imantisco/mantisco-github-action/ci/pull_request_generator@main
        with:
          dest_branch: main
        env:
          GITHUB_TOKEN: ${{ github.token }}
```