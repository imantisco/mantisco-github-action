# Test Helm Linter

[![Composition / Test Helm Linter](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_helm_linter_test.yaml/badge.svg)](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_helm_linter_test.yaml)

Helm Template과 values 파일을 동적으로 인식해서 테스트 진행

## Get Started

```yaml
name: Helm Linter

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  test:
    runs-on: ubuntu-22.04
    
    steps:
      - uses: imantisco/mantisco-github-action/composition/test_helm_linter@dev
        with:
          base_directory: ./composition/test_helm_linter
```