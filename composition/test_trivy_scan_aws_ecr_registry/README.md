# Test Trivy scan AWS ECR Registry

Trivy로 AWS ECR Registry 스캔하기

## Get Started

```yaml
name: Composition / Test Trivy Scan AWS ECR Resgistry

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  test:
    permissions:
      contents: read # for actions/checkout to fetch code
      security-events: write # for github/codeql-action/upload-sarif to upload SARIF results
      actions: read # only required for a private repository by github/codeql-action/upload-sarif to get the Action run status

    runs-on: ubuntu-22.04
    
    steps:
      - uses: imantisco/mantisco-github-action/composition/test_trivy_scan_aws_ecr_registry@dev
        with:
          format: "sarif"
          output_file: "trivy-results.sarif"
          image-ref: ${{ env.AWS_ECR_IMAGE_REF }}
        env:
          AWS_ACCESS_KEY_ID: ${{ env.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ env.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: ${{ env.AWS_DEFAULT_REGION }}
          
      - name: Output
        shell: bash
        run: |
          echo ${{ steps.test_trivy_scan_github_iac_conf.outputs.trivy-result }}
```

## More Information

이 GitHub Composite Action을 활성화하면 자동으로 <br>
`Bot(github-advanced-security)`가 코멘트를 남깁니다.

<img src="./image.png" style="width: 600px;" />

실습 예제인 [Get Started](./README.md#get-started)을 `.github/workflows/*.yaml` 파일로 추가하면 <br>
`All checks have passed` 탭에 `Code scanning results / Trivy`가 추가됩니다.

<img src="./image-1.png" style="width: 600px;" />

해당 워크플로가 완료되면 `GitHub Advanced Security / Trivy`가 추가됩니다. <br>
최종적으로 GitHub 저장소의 Security 탭에 그 결과가 기록됩니다.

<img src="./image-2.png" style="width: 600px;" />
