# fargate-deploy

Assumes an IAM role and then uses `fargate-cli` to update the container image
version of a service.

## Example usage

```yaml
- name: Deploy to production
  uses: leonardehrenfried/fargate-deploy@v1
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID}}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY_ID}}
  with:
    role-to-assume: arn:aws:iam::831125543853:role/deployer-role
    cluster: a-cluster-name
    service: webapp
    container-image: docker.pkg.github.com/orgname/reponame/image-name:${{ github.sha }}
```
