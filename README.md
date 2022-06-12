Go app structure
--

```
/app                     // global application level singletons like log, build infos, config etc..
/cmd                     // commandline application entry point, app starts here
/data                    // repositories implementations by infrastructures
  /firebase              // firebase implementations of repositories
    /customer            // an example customer repository implementation
  /redis
  /apiclientxx           // client implementation to some specific api
    /dto                 // dto for api
  /postgres
    /migrations          // database schema management
/delivery                // contains all delivery implementations
  /httpd                 // http delirvery implementation
    /dto                 // dto contract for our http server
    /handlers
    /middlewares
/entity                  // domain entities (like customer, org, invoice)
/pkg                     // generic shared packages, utilities (converters, operators) You can make separate repository for that
/repository              // repositories interfaces and mocks
/services                // services, business logic, stories
  /customer
```

To generate mocks use https://github.com/vektra/mockery/

Use https://github.com/golang-migrate tool to manage changes on db schema

