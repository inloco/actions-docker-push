# Docker Push Action

## Example

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        images: |
          incognia/example:blue
          incognia/example:green
          incognia/example:red
```

The example above is equivalent to run:

```bash
docker tag 'incognia/example:blue' '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-blue'
docker tag 'incognia/example:green' '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-green'
docker tag 'incognia/example:red' '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-red'
docker push '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-blue'
docker push '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-green'
docker push '{AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com/incognia/example:610d69f-red'
```
