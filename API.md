### Pairing

1. Pair request

POST `https://192.168.1.4:1926/6/pair/request`

params:

```json
{
	"scope": ["read", "write", "control"],
	"device": {
		"device_name": "heliotrope",
		"device_os": "Android",
		"app_name": "Pylips",
		"type": "native",
		"app_id": "app.id",
		"id": "jadsWsi4nQ31EeQi" // digest auth username
	}
}
```

response:

```json
{
	"error_id": "SUCCESS",
	"error_text": "Authorization required",
	"auth_key": "7669b4f59624c86ae1669deb62476350a8ad9bd619af35dfaf2858cc803992db", // digest auth password
	"timestamp": 106,
	"timeout": 60
}
```

If pairing is already in progress:

```json
{
	"error_id": "CONCURRENT_PAIRING",
	"error_text": "Another pairing is in process"
}
```

2. confirm pair

POST `https://192.168.1.4:1926/6/pair/grant`

params:

```json
{
	"auth": {
		"auth_AppId": "1",
		"pin": "7862",
		"auth_timestamp": 106,
		"auth_signature": "b'NzM4N2ZiYzI4OTMwYzAyYTc3NTc4ZmRjNWU0ZDljYWE2YzNkZTBkMQ=='"
	},
	"device": {
		"device_name": "heliotrope",
		"device_os": "Android",
		"app_name": "Pylips",
		"type": "native",
		"app_id": "app.id",
		"id": "jadsWsi4nQ31EeQi"
	}
}
```

For now on you need to include Digest Auth in every request. Pass the `device.id` as `username` and the `auth_key` as `password`.

example auth:

Digest Authentication

key | value
--- | ---
username | jadsWsi4nQ31EeQi
realm | XTV
nonce | MTU3MDk4NTY2NTgzODoxNTI3ZDU4YzRlNzY0YmFjMGY4OTU2MGQyMzlkMTkzNg==
uri | /6/pair/grant
response | b84c2a80c7d15de38ffac1732709575d
algorithm | MD5
qop | auth
nc | 00000001
cnonce | bbefe0406bae3691

response:

```json
{
	"error_id": "SUCCESS",
	"error_text": "Pairing completed"
}
```

You are ready to control your tv.

#### Volume control

GET `https://192.168.1.7:1926/6/audio/volume`

response:

```json
{
	"muted": false,
	"current": 15,
	"min": 0,
	"max": 60
}
```

POST `https://192.168.1.7:1926/6/input/key`

parameters:

```json
{
	"key": "VolumeUp"
}
```

