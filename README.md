# Docker Push Action

## Example

```yaml
deploy:
  steps:
    - uses: inloco/actions-docker-push@HEAD
      with:
        image-repos: |
          incognia/image-blue
          incognia/image-green
          incognia/image-red
          incognia/image-yellow
```
