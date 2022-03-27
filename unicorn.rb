worker_processes 2
timeout 30
listen 8080
pid File.expand_path('tmp/pids/unicorn.pid', __FILE__)
preload_app true
# stderr_path File.expand_path('../../log/unicorn_stderr.log', __FILE__)
# stdout_path File.expand_path('../../log/unicorn_stdout.log', __FILE__)