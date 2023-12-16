import subprocess as sp

o = sp.Popen(['/challenge/embryoio_level48'], stdout=sp.PIPE, stderr=sp.PIPE)
out = sp.Popen(['cat'], stdin=o.stdout, stdout=sp.PIPE)
r, e = out.communicate()
