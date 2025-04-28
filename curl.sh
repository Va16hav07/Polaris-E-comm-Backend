# API Curl Examples for User Operations

## Register a new user (customer)
```bash
curl -X POST http://localhost:3000/api/users/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "phone": 1234567890
  }'
```

## Register a new seller
```bash
curl -X POST http://localhost:3000/api/users/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Seller Name",
    "email": "seller@example.com",
    "password": "password123",
    "phone": 9876543210,
    "type": 1
  }'
```

## User Login
```bash
curl -X POST http://localhost:3000/api/users/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

## Get User Profile (with authentication token)
```bash
curl -X GET http://localhost:3000/api/users/me \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_AUTH_TOKEN"
```

## Update User Profile
```bash
curl -X PUT http://localhost:3000/api/users/profile \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_AUTH_TOKEN" \
  -d '{
    "name": "John Doe Updated",
    "phone": 5555555555
  }'
```

## Get All Users (admin endpoint)
```bash
curl -X GET http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ADMIN_AUTH_TOKEN"
```

## Get User By ID
```bash
curl -X GET http://localhost:3000/api/users/USER_ID \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_AUTH_TOKEN"
```

## Delete User (with authentication)
```bash
curl -X DELETE http://localhost:3000/api/users/USER_ID \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_AUTH_TOKEN"
```
