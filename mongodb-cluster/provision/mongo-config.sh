rs.initiate( { _id: "configReplSet", configsvr: true, members: [ { _id: 0, host: "192.168.33.11:27019" }, { _id: 1, host: "192.168.33.12:27019" } ] } )
