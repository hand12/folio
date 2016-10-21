# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '52.198.208.2', user: 'yusuke', roles: %w{app db web} 

#デプロイするサーバにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/folio_key_rsa' 
