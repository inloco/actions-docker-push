# Docker Push Action

## Examples

### Single Registry

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        image-repos: incognia/example-blue

```

Resulting code:

```bash
docker tag 'incognia/example' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-blue:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-blue:123'
```

### Single Registry with Multiple Suffixes

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        image-repos: incognia/example
        image-suffixes: |
          -blue
          -green
          -red

```

Resulting code:

```bash
docker tag 'incognia/example' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-blue:123'
docker tag 'incognia/example' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-green:123'
docker tag 'incognia/example' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-red:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-blue:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-green:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/example-red:123'
```

### Multiple Registries

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        image-repos: |
          incognia/apple
          incognia/orange
          incognia/pineapple
```

Resulting code:

```bash
docker tag 'incognia/apple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple:123'
docker tag 'incognia/orange' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange:123'
docker tag 'incognia/pineapple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple:123'
```

### Multiple Registries with Multiple Suffixes

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        image-repos: |
          incognia/apple
          incognia/orange
          incognia/pineapple
        image-suffixes: |
          -blue
          -green
          -red
```

Resulting code:

```bash
docker tag 'incognia/apple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-blue:123'
docker tag 'incognia/apple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-green:123'
docker tag 'incognia/apple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-red:123'
docker tag 'incognia/orange' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-blue:123'
docker tag 'incognia/orange' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-green:123'
docker tag 'incognia/orange' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-red:123'
docker tag 'incognia/pineapple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-blue:123'
docker tag 'incognia/pineapple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-green:123'
docker tag 'incognia/pineapple' '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-red:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-blue:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-green:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/apple-red:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-blue:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-green:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/orange-red:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-blue:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-green:123'
docker push '${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/incognia/pineapple-red:123'
```