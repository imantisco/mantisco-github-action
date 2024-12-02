# Test Helm Tempalte

[![Composition / Test Helm Template](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_helm_temlate_test.yaml/badge.svg)](https://github.com/imantisco/mantisco-github-action/actions/workflows/composition_test_helm_temlate_test.yaml)

Helm Template과 values 파일을 동적으로 인식해서 테스트 진행

## Get Started

```yaml
name: Helm Template

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  test:
    runs-on: ubuntu-22.04
    
    steps:
      - uses: imantisco/mantisco-github-action/composition/test_helm_template@dev
        with:
          base_directory: ./composition/test_helm_template
```