Go app structure
--

```
/app                     // global application level singletons like log, build infos, config etc..
/cmd                     // commandline application entry point, app starts here
/delivery                // contains all delivery implementations
  /httpd                   // http delirvery implementation
    /dto                     // dto contract for our http server
    /handlers
    /middlewares
  /protobuf                // proto files
    /protogo                  // go lang generated from proto
/entity                  // domain entities (like customer, org, invoice)
/pkg                     // generic shared packages, utilities (converters, operators) You can make separate repository for that
/repository              // repositories interfaces and mocks
  /impl                    // repositories implementations by infrastructures
    /firebase              // firebase implementations of repositories
      /customer              // an example customer repository implementation
    /redis
    /apiclientxx           // client implementation to some specific api
      /dto                   // dto for api
    /postgres
      /migrations          // database schema management
/services                // services, business logic, stories
  /customer
```

- To generate mocks use https://github.com/vektra/mockery/
  Use ```//go:generate mockery --name InterfaceName``` to generate mocks with
  ```go generate command```

- Use https://github.com/golang-migrate tool to manage changes on db schema

- I recommend to look at https://github.com/hobord/go-modules (logger, worker
  etc..)

- Do not use directly log implementation, use Log interface
  Use CorrelationID and TraceID in logs to track process flows accross all services.
  Its good to see the file name and line number when You make logs.
  Its nice to know about version and githash in the logs.
