import subprocess as sp

o = sp.Popen(['/challenge/embryoio_level49'], stdout=sp.PIPE, stderr=sp.PIPE)
out = sp.Popen(['grep', 'pwn'], stdin=o.stdout, stdout=sp.PIPE)
r, e = out.communicate()
