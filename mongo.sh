mongo
MongoDB shell version v3.6.8
connecting to: mongodb://127.0.0.1:27017
Implicit session: session { "id" : UUID("7b4564ac-7288-47a4-80d3-096c31feb24f") }
MongoDB server version: 3.6.8
Server has startup warnings: 
2023-04-27T12:36:40.643+0530 I STORAGE  [initandlisten] 
2023-04-27T12:36:40.643+0530 I STORAGE  [initandlisten] ** WARNING: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine
2023-04-27T12:36:40.643+0530 I STORAGE  [initandlisten] **          See http://dochub.mongodb.org/core/prodnotes-filesystem
2023-04-27T12:36:52.253+0530 I CONTROL  [initandlisten] 
2023-04-27T12:36:52.253+0530 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2023-04-27T12:36:52.253+0530 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2023-04-27T12:36:52.253+0530 I CONTROL  [initandlisten] 
> show dbs;
AS1      0.000GB
Car      0.000GB
admin    0.000GB
config   0.000GB
local    0.000GB
masi     0.000GB
product  0.000GB
srd      0.000GB
test     0.000GB
zipcode  0.000GB

> use yash12;
switched to db yash12

> show collections;

> db.movie.insert({name:"RRR",realesed:2022,budget:434356,director:"SSR",rating:5});
WriteResult({ "nInserted" : 1 })

> db.movie.insert({name:"KGF",realesed:2022,budget:534356,director:"SSR",rating:5,comment:["GOOD","VERY GOOD"]});
WriteResult({ "nInserted" : 1 })

> db.movie.find();
{ "_id" : ObjectId("644a313cf639fe4a8227fe03"), "name" : "RRR", "realesed" : 2022, "budget" : 434356, "director" : "SSR", "rating" : 5 }
{ "_id" : ObjectId("644a3183f639fe4a8227fe04"), "name" : "KGF", "realesed" : 2022, "budget" : 534356, "director" : "SSR", "rating" : 5, "comment" : [ "GOOD", "VERY GOOD" ] }

> db.movie.find().pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "SSR",
	"rating" : 5
}
{
	"_id" : ObjectId("644a3183f639fe4a8227fe04"),
	"name" : "KGF",
	"realesed" : 2022,
	"budget" : 534356,
	"director" : "SSR",
	"rating" : 5,
	"comment" : [
		"GOOD",
		"VERY GOOD"
	]
}


>db.movie.insertMany([{name:"RRR",realesed:2022,budget:434356,director:"SSR",rating:5},
                     {name:"KGF",realesed:2022,budget:534356,director:"SSR",rating:5,comment:["GOOD","VERY GOOD"]},  
                     {name:"ABC",realesed:2021,budget:987654,director:"LMN",rating:2}]);
{
	"acknowledged" : true,
	"insertedIds" : [
		ObjectId("6451f1890c15ac6cef95cec2"),
		ObjectId("6451f1890c15ac6cef95cec3"),
		ObjectId("6451f1890c15ac6cef95cec4")
	]
}  

> db.movie.find().pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "YYY",
	"rating" : 5,
	"lastModified" : ISODate("2023-05-03T05:08:21.559Z")
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec2"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "SSR",
	"rating" : 5
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec3"),
	"name" : "KGF",
	"realesed" : 2022,
	"budget" : 534356,
	"director" : "SSR",
	"rating" : 5,
	"comment" : [
		"GOOD",
		"VERY GOOD"
	]
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec4"),
	"name" : "ABC",
	"realesed" : 2021,
	"budget" : 987654,
	"director" : "LMN",
	"rating" : 2
}
> 


> db.movie.find({realesed:2022}).pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "SSR",
	"rating" : 5
}
{
	"_id" : ObjectId("644a3183f639fe4a8227fe04"),
	"name" : "KGF",
	"realesed" : 2022,
	"budget" : 534356,
	"director" : "SSR",
	"rating" : 5,
	"comment" : [
		"GOOD",
		"VERY GOOD"
	]
}

> db.movie.find({budget:434356},{name:1}).pretty();
{ "_id" : ObjectId("644a313cf639fe4a8227fe03"), "name" : "RRR" }
> 

> db.movie.remove({budget:534356});
WriteResult({ "nRemoved" : 1 })

> db.movie.find().pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "SSR",
	"rating" : 5
}

> db.movie.updateOne({name : "RRR"},{$set :{"director" :"YYY"},$currentDate: { lastModified: true }})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

> db.movie.find().pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "YYY",
	"rating" : 5,
	"lastModified" : ISODate("2023-05-03T05:08:21.559Z")
}
> 
> db.movie.updateMany({name : "ABC"},{$set :{"director" :"YYZZ","rating" :"4"}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> db.movie.find().pretty();
{
	"_id" : ObjectId("644a313cf639fe4a8227fe03"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "YYY",
	"rating" : 5,
	"lastModified" : ISODate("2023-05-03T05:08:21.559Z")
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec2"),
	"name" : "RRR",
	"realesed" : 2022,
	"budget" : 434356,
	"director" : "SSR",
	"rating" : 5
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec3"),
	"name" : "KGF",
	"realesed" : 2022,
	"budget" : 534356,
	"director" : "SSR",
	"rating" : 5,
	"comment" : [
		"GOOD",
		"VERY GOOD"
	]
}
{
	"_id" : ObjectId("6451f1890c15ac6cef95cec4"),
	"name" : "ABC",
	"realesed" : 2021,
	"budget" : 987654,
	"director" : "YYZZ",
	"rating" : "4"
}
> 

