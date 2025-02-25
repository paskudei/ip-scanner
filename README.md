# README

---
GraphQL as API.

Для работы с этим выполняется POST запроса по урлу localhost:3000/graphql

---
### Enable IP

* Query
```GraphQL
   mutation enableIp($input: EnableIp!) {
       mutation: enableIp(input: $input) {
           id
           address
           enabled
           createdAt
           updatedAt
           __typename
       }
   }
```
* GraphQL variables
```json
    {
        "input": {
            "id": 1
        }
    }
```

---
### Disable IP

* Query
```GraphQL
   mutation disableIp($input: DisableIp!) {
       mutation: disableIp(input: $input) {
           id
           address
           enabled
           createdAt
           updatedAt
           __typename
       }
   }
```
* GraphQL variables
```json
    {
        "input": {
            "id": 1
        }
    }
```

---
### Create IP

* Query
```GraphQL
   mutation createIp($input: CreateIp!) {
       mutation: createIp(input: $input) {
           id
           address
           enabled
           createdAt
           updatedAt
           __typename
       }
   }
```
* GraphQL variables
```json
    {
        "input": {
            "address": "77.88.8.8",
            "enabled": true
        }
    }
```

---
### Destroy IP

* Query
```GraphQL
   mutation destroyIp($input: DestroyIp!) {
       mutation: destroyIp(input: $input) {
           id
           address
           enabled
           createdAt
           updatedAt
           __typename
       }
   }
```
* GraphQL variables
```json
    {
        "input": {
            "id": 1
        }
    }
```

---
### Calculate IP statistic

* Query
```GraphQL
    query CalculateStatistic($input: CalculateStatisticInput!) {
        ip: calculateStatistic(input: $input) {
            id
            statistic {
                avgRtt
                minRtt
                maxRtt
                medianRtt
                stdDev
                packetLoss
            }
            __typename
        }
    }
```
* GraphQL variables
```json
    {
        "input": {
            "id": 1,
            "timeFrom": "2025-02-23T16:24:35+00:00",
            "timeTo": "2025-02-26T16:24:35+00:00"
        }
    }
```