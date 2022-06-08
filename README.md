Go app structure
--

```
/app              // gloal application level singletons like log, build infos etc..
/cmd              // commandline application entry point, app starts here
/data             // reppositories infrastructures
     /firebase    // firebase implementations of repositories
     /redis
     /postgress
/delivery         // contains all io delivery implementations
/delivery/http    // http delirvery  implementation
/entity           // domain entities (like customer, org, invoice)
/pkg              // generic shared packages, utilities (converters, operators)
/repository       // repositories interfaces and mocks
/services         // services 
```
