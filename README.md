# Super Baker 3000

# Endpoints

/products
An unpaginated list of products

Sample Output
```
[
  {
    "id": 1,
    "name": "Adobe bread",
    "code": "ae0ec581-27dd-40dc-848f-1183e71d4224",
    "time_to_bake_in_seconds": 1608,
    "created_at": "2016-12-06T21:42:45.715Z",
    "updated_at": "2016-12-06T21:42:45.715Z"
  }
]
```


GET /bake_jobs

Sample Output
```
[
  {
  "completed_at": "2016-12-06T22:11:40.644Z",
  "id": 1,
  "state": "baking",
  "product_id": 1,
  "created_at": "2016-12-06T21:43:21.667Z",
  "updated_at": "2016-12-06T21:44:51.648Z"
  }
]

```

GET /bake_jobs/:id

Sample Output
```
{
  "completed_at": "2016-12-06T22:13:53.422Z",
  "id": 1,
  "state": "baking",
  "product_id": 1,
  "created_at": "2016-12-06T21:43:21.667Z",
  "updated_at": "2016-12-06T21:47:03.423Z"
}

```


POST /bake_jobs

Sample Input
```
{
	"bake_job": {
	  "quantity": 10
	}
}
```

Sample Output
```
{
  "id": 2,
  "product_id": 1,
  "completed_at": "2016-12-06T22:20:15.166Z",
  "state": "waiting",
  "created_at": "2016-12-06T21:53:27.167Z",
  "updated_at": "2016-12-06T21:53:27.167Z"
}

```
