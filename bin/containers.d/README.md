Creating A Container
====================

```
create_container("name", "crowdtap/docker-name", 1000, 2000, 3000)
```

This will create a container by utilizing the `Dockerfile` under the `crowdtap/docker-name` repository as well as forward any ports provided. There are a fair amount of `Dockerfile` repos under the `crowdtap/docker-` namespace. You could also just as easily provide a different source of your preferred `Dockerfile` by changing the first parameter.