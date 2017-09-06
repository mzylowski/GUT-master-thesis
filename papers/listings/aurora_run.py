pkg_path = 'aurora_task.py'

import hashlib
with open(pkg_path, 'rb') as f:
  pkg_checksum = hashlib.md5(f.read()).hexdigest()

install = Process(
  name = 'fetch_package',
  cmdline = 'cp %s . && echo %s && chmod +x hello_world.py' % (pkg_path, pkg_checksum))

hello_world = Process(
  name = 'hello_world',
  cmdline = 'python -u hello_world.py')

hello_world_task = SequentialTask(
  processes = [install, hello_world],
  resources = Resources(cpu = 1, ram = 1*MB, disk=8*MB))

jobs = [
  Service(cluster = 'devcluster',
          environment = 'devel',
          role = 'www-data',
          name = 'hello_world',
          task = hello_world_task)
]
