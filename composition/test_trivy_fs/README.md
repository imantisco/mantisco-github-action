# Test Trivy FS

[![Composition / Test Trivy FS (FileSystem)](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_trivy_fs.yaml/badge.svg)](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_trivy_fs.yaml)

Trivy로 FileSystem 테스트하기

## Get Started

```yaml
name: Composition / Test Trivy FS (FileSystem)

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  test:
    runs-on: ubuntu-22.04
    
    steps:
      - uses: imantisco/mantisco-github-action/composition/test_trivy_fs@dev
```