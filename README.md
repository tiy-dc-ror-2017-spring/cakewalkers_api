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
  "id": 1,
  "product_id": 203,
  "completed_at": null,
  "quantity": 10,
  "estimated_time_to_completion_in_seconds": 3003,
  "started_at": "2016-12-06T22:02:58.430Z",
  "state": "baking",
  "created_at": "2016-12-06T22:01:27.127Z",
  "updated_at": "2016-12-06T22:02:58.432Z"
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


POST /bake_jobs/ae0ec581-27dd-40dc-848f-1183e71d4224

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
  "id": 1,
  "product_id": 203,
  "completed_at": null,
  "quantity": 10,
  "estimated_time_to_completion_in_seconds": 3003,
  "started_at": "2016-12-06T22:02:58.430Z",
  "state": "baking",
  "created_at": "2016-12-06T22:01:27.127Z",
  "updated_at": "2016-12-06T22:02:58.432Z"
}

```
