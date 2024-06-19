### current state
proof of concept works. i have a(n emulated) local disk that is locked by a separate dok.
the entire thing is locked and unlocked manually.

### end goal
a secured environment that can only be unlocked by an external USB key.

### steps
1. automate locking and unlocking environment via shell scripts
2. write a script to check if the key is connected
3. alter systemd `getty` service to activate the environment if the key is connected
4. add LUKS format below the current filesystem format
5. create new cgroup for the shell process running in the environment
6. add namespace isolation with `unshare`
