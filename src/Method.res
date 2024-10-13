type methods = array<string>
@module("node:http") external _METHODS: Nullable.t<methods> = "METHODS"

/** Get the current nodejs methods */
let getCurrentNodeMethods = () => {
    _METHODS
    -> Nullable.toOption 
    -> Option.map(methods => methods -> Array.map(String.toLowerCase))
}

/** Get the "basic" Node.js methods, a snapshot from Node.js 0.10. */
let getBasicNodeMethods = () => {
    [ "get",
      "post",
      "put",
      "head",
      "delete",
      "options",
      "trace",
      "copy",
      "lock",
      "mkcol",
      "move",
      "purge",
      "propfind",
      "proppatch",
      "unlock",
      "report",
      "mkactivity",
      "checkout",
      "merge",
      "m-search",
      "notify",
      "subscribe",
      "unsubscribe",
      "patch",
      "search",
      "connec" ]
}

/** Determine which method names to use based on the results of getCurrentNodeMethods. */
let getMethods = () => {
    getCurrentNodeMethods() -> Option.getOr(getBasicNodeMethods())
}