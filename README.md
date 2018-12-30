
```
php bin/console oauth:create-client --redirect-uri="http://example.local/" --grant-type="authorization_code" --grant-type="password" --grant-type="refresh_token" --grant-type="token" --grant-type="client_credentials"

php bin/console oauth:create-client --redirect-uri=http://example2.local --grant-type=password --grant-type=refresh_token

php bin/console app:create-user test1 123456 tuanquynh0508@gmail.com

php bin/console doctrine:schema:update --force
```

# RUN
```
symfony serve
```

# References
- https://causeyourestuck.io/2016/07/19/oauth2-explained-part-2-setting-up-oauth2-with-symfony2-using-fosoauthserverbundle/
- https://medium.com/@mkt_43322/how-to-set-a-symfony-based-rest-api-with-oauth-bf5f867793c9
- https://gist.github.com/GrzegorzBandur/a2a4e7f024233e1c0bb3b9a39571d68a

# Data Test
ClientId: 2_gq0lokvm69wkck480000gsc4ckc80ow0gk48kckg0gooo8wo8
ClientSecret: 4v7bcejftgg08kswog0scw4okks4skgwcw0sg0w4os4sw4w0w0

ClientId: 1_4zslnz4pf58oksw4c44cko4ggk8kswwksgg8088sc488k0o4cg
ClientSecret: 569pvyguavwgwkgkk8gk8oco8gogwggsosk444o04ococg4wcs

# Test OAuth
https://localhost:8000/oauth/v2/token
{
    "grant_type": "password",
    "client_id": "1_4654cpi0zu0wokk4g04gk0w444wkkwcs4sg0okoo0gks0gcokg",
    "client_secret": "1h7xdjjo6ixwwow0w00oss4sgc0w8o48ocgw808w0gg4s40owc",
    "username": "ricardo.correia",
    "password": "password"
}

https://localhost:8000/oauth/v2/token
{
    "grant_type": "refresh_token",
    "client_id": "1_4654cpi0zu0wokk4g04gk0w444wkkwcs4sg0okoo0gks0gcokg",
    "client_secret": "1h7xdjjo6ixwwow0w00oss4sgc0w8o48ocgw808w0gg4s40owc",
    "refresh_token": "OWQyNTI1MDk4OTlhZTk0NDdlYzA0YTM4ZTFlZDZjMmQxNDY3OTBjMzBiNTYzOWMwMTgxN2UwMGYwYWE3M2RiYw"
}

	
https://localhost:8000/oauth/v2/auth?client_id=2_gq0lokvm69wkck480000gsc4ckc80ow0gk48kckg0gooo8wo8&response_type=code&redirect_uri=http://example.com	