# puppet-devops
Devops Assignment

TODO:
Modify the manifest environments/test/manifests/site.pp to - 
1. Create below directory structure using puppet.
```/var/www/
└── test-app
    ├── current
    │   └── index.html
    ├── releases
    └── shared```
2. Create a self signed certificate and add it to modules/nginx/files/ as example.com.crt and example.com.key
3. Fix the nginx configuration to match the config file testapi.example.com.conf (Additional location blocks in ssl server). Refer the Readme in nginx module for syntaxes.
4. Change the number of worker_processes to 2 in nginx.conf.
5. Test the puppet code using vagrant and resolve issues if any (Vagrantfile is present in the repo).
