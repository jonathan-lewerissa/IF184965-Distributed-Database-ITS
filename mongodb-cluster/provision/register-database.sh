use kickstarter
sh.enableSharding("kickstarter")

use config
db.databases.find()

use kickstarter
db.projects.ensureIndex( {_id: "hashed"} )
sh.shardCollection("kickstarter.projects", {"_id": "hashed"})
