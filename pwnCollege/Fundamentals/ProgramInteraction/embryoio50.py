import subprocess as sp

o = sp.Popen(['/challenge/embryoio_level50'], stdout=sp.PIPE, stderr=sp.PIPE)
out = sp.Popen(['sed', 's/.*/&/'], stdin=o.stdout, stdout=sp.PIPE)
r, e = out.communicate()

