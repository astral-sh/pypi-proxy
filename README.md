# pypi-proxy

A simple reverse proxy for the [official Python package index](https://pypi.org).

## Unauthenticated

`https://pypi-proxy.fly.dev` is a proxy for `https://pypi.org`.

Note a `/simple` suffix is required for usage with tools like `pip`.

## Authenticated

`https://pypi-proxy.fly.dev/basic-auth` is a proxy for `https://pypi.org` with HTTP basic authentication.

`https://files.pythonhosted.org/` is replaced with `https://pypi-proxy.fly.dev/basic-auth/files`
in responses to avoid bypassing authentication when downloading files. Requests to `https://pypi-proxy.fly.dev/basic-auth/files` are redirected to `https://files.pythonhosted.org/`.

The username is `public` and the password is `heron` and can be provided in the URL e.g. `https://public:heron@pypi-proxy.fly.dev/basic-auth`.

### Multiple passwords

For testing multiple indexes with separate credentials on a single realm, there are authenticated
proxies at `https://pypi-proxy.fly.dev/basic-auth-heron/` and
`https://pypi-proxy.fly.dev/basic-auth-eagle/` with the respective name as a password.

## Contributing

Build and run the image:

```
docker build -t pypi-proxy .
docker run --rm -p 80:8080 -i pypi-proxy
```

Use `localhost` instead of the deployed domain name to test.
