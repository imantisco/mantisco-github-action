# Test Trivy GitHub Code

Trivy로 GitHub Code 스캔하기

## Get Started

```yaml
name: Composition / Test Trivy GitHub (FileSystem)

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  test:
    runs-on: ubuntu-22.04
    
    steps:
      - uses: imantisco/mantisco-github-action/composition/test_trivy_scan_github_code@dev
```