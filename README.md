
```
php bin/console fos:oauth-server:create-client --redirect-uri="..." --grant-type="..."
php bin/console fos:oauth-server:create-client --redirect-uri="http://shopmanager.local" --grant-type="password" --grant-type="refresh_token" --grant-type="token" --grant-type="client_credentials" --grant-type="authorization_code" --grant-type="implicit" --grant-type="device_code"
php bin/console fos:user:create testuser test@example.com p@ssword
php bin/console fos:user:create test tuanquynh0508@gmail.com 123456

php bin/console generate:bundle --namespace=cleverti/MySuperRestBundle --no-interaction
php bin/console generate:controller --no-interaction --controller=cleverti\MySuperRestBundle:Rest

php bin/console doctrine:schema:update --force

php bin/console debug:router
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
ClientId: 1_1rxx03p717a8gsk4c4sswgk4cscggk4sgoks8w8okwc4okccgg
ClientSecret: 2qanogpkahicgswo40kgwsc4g0oswc8k80skw0cc0g84cggwc

Account: test1 / 123456

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

	
http://sysclient.local/oauth/v2/auth?client_id=1_fbdkmdld8n400c8oss4k808okosko00k0s00sck44oww8okck&response_type=code&redirect_uri=http://example.local/

http://sysclient.local/oauth/v2/auth?client_id=2_39mfhvo2d9c0sc0c0wooos4ock8c4w8wwo40s0ck4owoww4ocw&response_type=code&redirect_uri=http://example2.local

Validate Code
http://example.local/?state=&code=YTkxN2I2OTgyYWJiNzU4OGZlZjg1YTdmYmU1ZTRhMjE0MjYzMWY3NTZlZWYzMGFmZjI2MWU2Y2QyOTBjNmNmZA


# Virtual Host
sudo gedit /etc/apache2/sites-available/shopmanager.conf
sudo a2ensite shopmanager.conf
sudo service apache2 restart
sudo gedit /etc/hosts
127.0.0.1 shopmanager.local

sudo a2dissite example.conf
sudo service apache2 restart
```
<VirtualHost *:80>

        Define server_name sysclient.local
        Define basedocroot  /home/nntuan/labs/sys_client
        Define docrootweb   ${basedocroot}/public
        Define logdir   ${APACHE_LOG_DIR}/
        SetEnv APP_DEBUG true
        SetEnv APP_ENV dev
        
        <FilesMatch \.php$>
            SetHandler proxy:fcgi://127.0.0.1:9000
            # for Unix sockets, Apache 2.4.10 or higher
            # SetHandler proxy:unix:/path/to/fpm.sock|fcgi://dummy
        </FilesMatch>

        ServerName ${server_name}
        DocumentRoot ${docrootweb}
        ErrorLog ${logdir}/sysclient-error.log
        CustomLog ${logdir}/sysclient-access.log Combined

        RewriteEngine On
        RewriteCond %{HTTP:Authorization} ^(.*)
        RewriteRule .* - [e=HTTP_AUTHORIZATION:%1]

        <Directory ${docrootweb}>
            AllowOverride All
            Require all granted
        </Directory>

        <Directory ${basedocroot}/var>
            <IfModule mod_authz_core.c>
                Require all denied
            </IfModule>
            <IfModule !mod_authz_core.c>
                Order deny,allow
                Deny from all
            </IfModule>
        </Directory>

        <Directory ${docrootweb}>
            DirectoryIndex ${docrootweb}/index.php
            <IfModule mod_negotiation.c>
                Options -MultiViews
            </IfModule>

            <IfModule mod_rewrite.c>
                RewriteEngine On
                RewriteCond %{REQUEST_URI}::$1 ^(/.+)/(.*)::\2$
                RewriteRule ^(.*) - [E=BASE:%1]

                RewriteCond %{HTTP:Authorization} .
                RewriteRule ^ - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

                RewriteCond %{ENV:REDIRECT_STATUS} ^$
                RewriteRule ^index\.php(?:/(.*)|$) %{ENV:BASE}/$1 [R=301,L]

                RewriteCond %{REQUEST_FILENAME} -f
                RewriteRule ^ - [L]

                RewriteRule ^ %{ENV:BASE}/index.php [L]
            </IfModule>

            <IfModule !mod_rewrite.c>
                <IfModule mod_alias.c>
                    RedirectMatch 302 ^/$ /index.php/
                </IfModule>
            </IfModule>
        </Directory>

        Undefine server_name
        Undefine basedocroot
        Undefine docrootweb
        Undefine logdir
</VirtualHost>


server {
    server_name domain.tld www.domain.tld;
    root /var/www/project/public;

    location / {
        # try to serve file directly, fallback to index.php
        try_files $uri /index.php$is_args$args;
    }

    location ~ ^/index\.php(/|$) {
        fastcgi_pass unix:/var/run/php/php7.1-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;

        # optionally set the value of the environment variables used in the application
        # fastcgi_param APP_ENV prod;
        # fastcgi_param APP_SECRET <app-secret-id>;
        # fastcgi_param DATABASE_URL "mysql://db_user:db_pass@host:3306/db_name";

        # When you are using symlinks to link the document root to the
        # current version of your application, you should pass the real
        # application path instead of the path to the symlink to PHP
        # FPM.
        # Otherwise, PHP's OPcache may not properly detect changes to
        # your PHP files (see https://github.com/zendtech/ZendOptimizerPlus/issues/126
        # for more information).
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
        # Prevents URIs that include the front controller. This will 404:
        # http://domain.tld/index.php/some-path
        # Remove the internal directive to allow URIs like this
        internal;
    }

    # return 404 for all other php files not matching the front controller
    # this prevents access to other php files you don't want to be accessible.
    location ~ \.php$ {
        return 404;
    }

    error_log /var/log/nginx/project_error.log;
    access_log /var/log/nginx/project_access.log;
}
```	